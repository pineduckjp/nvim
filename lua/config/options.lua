-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
opt.relativenumber = false

opt.termguicolors = true

opt.wrap = true

opt.tabstop = 2
opt.shiftwidth = 2
-- opt.expandtab = true
opt.softtabstop = -1

opt.showmatch = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.updatetime = 300

opt.signcolumn = "yes"

vim.o.showmode = false

opt.list = true
opt.listchars:append("space:·")

vim.o.pumheight = 6

vim.opt.clipboard = "unnamedplus"

local osc52 = require("vim.ui.clipboard.osc52")
local function paste()
  -- 端末への読み取り要求は送らず、内部レジスタを返す(フリーズ防止)
  return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
  name = "OSC 52 (copy only)",
  copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
  paste = { ["+"] = paste, ["*"] = paste },
}
