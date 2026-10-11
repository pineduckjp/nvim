return {
  {
    "LazyVim/LazyVim",
    opts = function()
      -- SSH先など、リモート環境のときだけOSC52を使う
      if vim.env.SSH_TTY then
        local osc52 = require("vim.ui.clipboard.osc52")
        vim.g.clipboard = {
          name = "OSC 52",
          copy = {
            ["+"] = osc52.copy("+"),
            ["*"] = osc52.copy("*"),
          },
          paste = {
            -- 多くの端末は貼り付け(読み取り)に未対応なので、内部レジスタを返す
            ["+"] = function()
              return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
            end,
            ["*"] = function()
              return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
            end,
          },
        }
      end
    end,
  },
}
