return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "astro",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "marksman",
        "taplo",
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      -- cmp_nvim_lsp が存在する場合のみ capabilities を拡張する
      local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = status and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

      -- HTML LSPの設定
      lspconfig.html.setup({
        filetypes = { "html", "astro", "markdown" },
      })

      -- Markdown LSPの設定
      lspconfig.marksman.setup({
        capabilities = capabilities,
        filetypes = { "markdown", "mdx" },
      })

      -- sqls を手動で設定（システムにインストール済みの場合）
      if vim.fn.executable("sqls") == 1 then
        lspconfig.sqls.setup({
          capabilities = capabilities,
          cmd = { "sqls" },
        })
      end
    end,
  },
}
