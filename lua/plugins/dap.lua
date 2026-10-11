return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = {
    -- デバッグ操作のキーマップ (<leader>d*)
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Start/Continue Debugging",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle DAP UI",
    },
    {
      "<leader>dx",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate Debugging",
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Masonから js-debug-adapter をインストール・設定
    require("mason").setup()
    require("mason-nvim-dap").setup({
      ensure_installed = { "js-debug-adapter" },
      handlers = {}, -- デフォルトの設定を適用
    })

    -- DAP UI のセットアップ
    dapui.setup()

    -- デバッグ開始時にUIを自動で開き、終了時に閉じる
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
