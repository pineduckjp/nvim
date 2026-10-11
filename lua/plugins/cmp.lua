return {
  {
    "hrsh7th/nvim-cmp",
    enable = false,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      -- 既存のsources配列がない場合は初期化
      opts.sources = opts.sources or {}

      -- 設定を追加
      table.insert(opts.sources, {
        name = "path",
        option = {
          get_cwd = function()
            return vim.fn.getcwd()
          end,
        },
      })
    end,
  },
}
