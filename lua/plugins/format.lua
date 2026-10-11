return {
  "stevearc/conform.nvim",
  enabled = true, -- 無効化する場合は true にする
  event = { "BufWritePre" }, -- ファイルを保存する直前に実行
  cmd = { "ConformInfo" },
  opts = {
    -- 言語ごとに使うフォーマッターを指定
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" }, -- ← React / React Native はここ！
      astro = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      mdx = { "prettier" },
      toml = { "taplo" },
      sql = { "sqlfluff" },
    },
    -- -- 保存時に自動整形する設定
    -- format_on_save = {
    --   lsp_fallback = true, -- フォーマッターがない場合はLSPの整形機能を使う
    --   timeout_ms = 500, -- 0.5秒以内に整形が終わらない場合はタイムアウト
    -- },
  },
}
