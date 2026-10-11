return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      pickers = {
        find_files = {
          theme = "dropdown",
        },
      },
      extensions = {
        file_browser = {
          hidden = false,
        },
      },
    },
    keys = {
      {
        "<leader>tf",
        function()
          require("telescope.builtin").find_files()
        end,
        mode = "n",
        desc = "Telescope find files",
      },
      {
        "<leader>tg",
        function()
          require("telescope.builtin").live_grep()
        end,
        mode = "n",
        desc = "Telescope live grep",
      },
      {
        "<leader>tb",
        function()
          require("telescope.builtin").buffers()
        end,
        mode = "n",
        desc = "Telescope buffers",
      },
      {
        "<leader>th",
        function()
          require("telescope.builtin").help_tags()
        end,
        mode = "n",
        desc = "Telescope help tags",
      },
      {
        "<leader>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        mode = "n",
        desc = "Telescope file browser",
      },
      {
        "<leader>fB",
        function()
          require("telescope").extensions.file_browser.file_browser({
            path = vim.fn.expand("%:p:h"),
            select_buffer = true,
            respect_gitignore = false,
          })
        end,
        mode = "n",
        desc = "Telescope file browser (show gitignored)",
      },
      {
        "<leader>fh",
        ":Telescope file_browser path=/Users/pineduck/.local/share/nvim/copilotchat_history select_buffer=true<CR>",
        mode = "n",
        desc = "Telescope file browserでセッションを開く",
      },
      {
        "<leader>fa",
        ":Telescope file_browser path=/Users/pineduck/.local/state/nvim/sessions select_buffer=true<CR>",
        mode = "n",
        desc = "Telescope file browserでCopilotChatの履歴を開く",
      },
    },
  },
}
