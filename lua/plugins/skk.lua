return {
  -- Skkeleton: SKK 日本語入力
  {
    "vim-skk/skkeleton",
    enabled = true,
    lazy = false,
    dependencies = {
      { "vim-denops/denops.vim", lazy = false },
    },
    config = function()
      vim.cmd([[ call skkeleton#config({
        \ 'globalDictionaries': ['~/skk/SKK-JISYO.L'],
        \ 'eggLikeNewline': v:true,
        \ 'showCandidatesCount': 999999,
        \ })]])

      vim.api.nvim_create_autocmd("User", {
        pattern = "DenopsPluginPost:skkeleton",
        once = true,
        callback = function()
          vim.fn["skkeleton#initialize"]()
        end,
      })
    end,
    keys = {
      {
        "<C-j>",
        "<Plug>(skkeleton-toggle)",
        mode = { "i", "c", "t" },
        noremap = false,
        desc = "Skkeleton モードをトグルする",
      },
    },
  },
}
