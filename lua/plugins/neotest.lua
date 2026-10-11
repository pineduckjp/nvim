return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest", -- Vitest用アダプタ
  },
  keys = {
    -- テスト実行のキーマップ (<leader>dt* など)
    {
      "<leader>dt",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest Test",
    },
    {
      "<leader>dT",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run Current File Tests",
    },
    -- テストをデバッグモードで実行するキーマップ
    {
      "<leader>dd",
      function()
        -- 直下の行の missing-fields 警告を無視する
        ---@diagnostic disable-next-line: missing-fields
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug Nearest Test",
    },
    {
      "<leader>ds",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Test Summary",
    },
    {
      "<leader>do",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Show Test Output",
    },
  },
  config = function()
    -- 直下の行の missing-fields 警告を無視する
    ---@diagnostic disable-next-line: missing-fields
    require("neotest").setup({
      adapters = {
        require("neotest-vitest")({
          -- プロジェクトのルートディレクトリにvitestのconfigがない場合のパス指定なども可能
          -- 通常は空の設定で動作する
        }),
      },
    })
  end,
}
