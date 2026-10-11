return {
  "akinsho/bufferline.nvim",
  enabled = true,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  opts = {
    options = {
      -- バッファ番号を非表示
      numbers = "none",
      -- バッファの閉じるアイコンを表示
      show_buffer_close_icons = true,
      -- 全体の閉じるアイコンを表示
      show_close_icon = true,
      -- セパレーターのスタイル
      separator_style = "slant",
    },
  },
  keys = {
    -- バッファを左に移動
    { "<Tab>h", "<Cmd>BufferLineMovePrev<CR>", mode = "n", desc = "バッファを左に移動" },
    -- バッファを右に移動
    { "<Tab>l", "<Cmd>BufferLineMoveNext<CR>", mode = "n", desc = "バッファを右に移動" },
    -- 現在のバッファを閉じる
    {
      "<Tab>x",
      function()
        if vim.bo.buftype == "terminal" then
          vim.cmd("bdelete!")
          return
        end

        vim.cmd("bdelete")
      end,
      mode = "n",
      desc = "現在のバッファを閉じる",
    },
  },
}
