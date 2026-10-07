-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

-- バッファを開くたびにスペルチェックを強制オフ
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- ターミナルバッファではnumber/signcolumn/scrolloff系を常に無効化する
-- (Neovimはターミナルモード中のみscrolloff/sidescrolloffを0に強制するため、
--  ノーマルモードに切り替えるとグローバル設定のsidescrolloff=8が復活し、
--  カーソル位置を確保するための横スクロールが発生してlazygit等のTUIアプリの
--  画面が左にずれて崩れる。バッファローカルで常時0にすることで防ぐ)
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.scrolloff = 0
    vim.opt_local.sidescrolloff = 0
  end,
})
