return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      -- LazyVimデフォルトのon_attach（]h [h や <leader>ghp などのキーマップ）を維持しつつ追加する
      local lazyvim_on_attach = opts.on_attach

      opts.on_attach = function(buffer)
        if lazyvim_on_attach then
          lazyvim_on_attach(buffer)
        end

        local gs = package.loaded.gitsigns

        -- <leader>ghd をトグル化: 既にdiff表示中なら現在のタブページ内のdiffウィンドウだけを
        -- まとめて閉じて後始末する。そうでなければ通常通りdiffthisを開く。
        -- 現在のタブページ内に限定することで、他タブのdiffペアを壊さないようにしている。
        vim.keymap.set("n", "<leader>ghd", function()
          if vim.wo.diff then
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
              if vim.api.nvim_win_is_valid(win) and vim.wo[win].diff then
                local win_buf = vim.api.nvim_win_get_buf(win)
                local name = vim.api.nvim_buf_get_name(win_buf)
                if name:match("^gitsigns://") and #vim.api.nvim_tabpage_list_wins(0) > 1 then
                  pcall(vim.api.nvim_win_close, win, false)
                else
                  vim.wo[win].diff = false
                end
              end
            end
          else
            gs.diffthis()
          end
        end, { buffer = buffer, desc = "Diff This (トグルで閉じる)" })
      end

      return opts
    end,
  },
}
