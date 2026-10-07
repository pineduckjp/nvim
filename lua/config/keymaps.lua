-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- <Esc>dでウィンドウを閉じる
keymap.set("n", "<Leader><Tab>q", "<Cmd>bd<CR>", { desc = "タブを閉じる" })
keymap.set("n", "<Leader><Tab>Q", "<Cmd>bd!<CR>", { desc = "タブを強制で閉じる" })
-- <Esc>qでnvimを閉じる
keymap.set("n", "<Esc>q", "<Cmd>qa<CR>", { desc = "nvimを閉じる" })
keymap.set("n", "<Esc>Q", "<Cmd>qa!<CR>", { desc = "nvimを強制で閉じる" })

-- <Leader>trでTERMINLをタブで開く
keymap.set("n", "<Leader>tr", "<Cmd>tab terminal<CR>", { desc = "TERMINALをタブで開く" })

-- <leader>ggでLazygit をタブで開く
local function open_lazygit_in_tab(cwd)
  if vim.fn.executable("lazygit") ~= 1 then
    vim.notify("lazygit が見つかりません", vim.log.levels.ERROR)
    return
  end

  vim.cmd("tabnew")
  local job_id = vim.fn.termopen({ "lazygit" }, { cwd = cwd })
  if job_id <= 0 then
    vim.notify("lazygit を起動できませんでした", vim.log.levels.ERROR)
    return
  end
  vim.cmd("startinsert")
end

keymap.set("n", "<leader>gg", function()
  open_lazygit_in_tab(LazyVim.root.git() or vim.fn.getcwd())
end, { desc = "Lazygitをタブで開く (プロジェクトルート)" })
keymap.set("n", "<leader>gG", function()
  open_lazygit_in_tab(vim.fn.getcwd())
end, { desc = "Lazygitをタブで開く (カレントディレクトリ)" })

local function search_and_replace_symbol()
  require("grug-far").open({
    transient = true,
    prefills = {
      search = vim.fn.expand("<cword>"),
      paths = LazyVim.root(),
    },
  })
end

keymap.set({ "n", "x" }, "<leader>sr", search_and_replace_symbol, {
  desc = "プロジェクト内のシンボルを検索・置換",
})
-- <Leader>tjでTERMINLを下画面で高さ30%で開く
keymap.set("n", "<Leader>tj", function()
  local h = math.max(1, math.floor(vim.o.lines * 0.3))
  vim.cmd("botright split")
  vim.cmd("resize " .. h)
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "TERMINALを下画面で30%で開く" })
-- <Leader>tlでTERMINLを左画面で幅30%で開く
keymap.set(
  "n",
  "<Leader>tl",
  "<Cmd>vsplit | vertical resize 45 | terminal<CR>",
  { desc = "TERMINALを左画面で45%で開く" }
)
-- <C-q>でTERMINALからNORMALに変更 (Escはclaude等のCLIにそのまま渡すため使わない)
keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "TERMINALからNORMALに変更" })
-- <Leader>tqでTERMINALを閉じるかつウィンドを閉じる
keymap.set("n", "<Leader>tq", "<C-\\><C-n><Cmd>bd<CR>", { desc = "TERMINALを閉じる" })

-- <Leader>nhで検索ハイライトを閉じる
keymap.set("n", "<Leader>nh", "<Cmd>nohlsearch<CR>", { desc = "検索ハイライトを閉じる" })

-- <M-↑>で上のウィンドウへ移動
keymap.set("n", "<M-Up>", "<C-w>k", {})
-- <M-↓>で下のウィンドウへ移動
keymap.set("n", "<M-Down>", "<C-w>j", {})
-- <M-←>で左のウィンドウへ移動
keymap.set("n", "<M-Left>", "<C-w>h", {})
-- <M-→>で右のウィンドウへ移動
keymap.set("n", "<M-Right>", "<C-w>l", {})
-- <M-,>でウィンドウ高さを拡大する
keymap.set("n", "<M-,>", "<C-w>+", {})
-- <M-.>でウィンドウ高さを縮小する
keymap.set("n", "<M-.>", "<C-w>-", {})
-- <M-]>でウィンドウ幅を拡大する
keymap.set("n", "<M-]>", "<C-w>>", {})
-- <M-[>でウィンドウ幅を縮小する
keymap.set("n", "<M-[>", "<C-w><", {})
