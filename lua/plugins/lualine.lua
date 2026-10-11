return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, _)
      local skk_modes = {
        [""] = { label = "英語", color = { bg = "#3b4261", fg = "#c0caf5" } },
        hira = { label = "日本語", color = { bg = "#2e7d32", fg = "#ffffff" } },
        kata = { label = "カタカナ", color = { bg = "#1565c0", fg = "#ffffff" } },
        hankata = { label = "半角カナ", color = { bg = "#6a1b9a", fg = "#ffffff" } },
        zenkaku = { label = "全角英数", color = { bg = "#b45309", fg = "#ffffff" } },
      }

      local function skk_mode()
        local mode = vim.fn["skkeleton#mode"]()
        return (skk_modes[mode] or { label = mode }).label
      end

      local function skk_mode_color()
        local mode = vim.fn["skkeleton#mode"]()
        return skk_modes[mode] and skk_modes[mode].color or { bg = "#4b5563", fg = "#ffffff" }
      end

      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("skk_lualine", { clear = true }),
        pattern = "skkeleton-mode-changed",
        callback = function()
          require("lualine").refresh({ place = { "statusline" } })
        end,
      })

      return {
        sections = {
          lualine_x = {
            {
              skk_mode,
              color = skk_mode_color,
              separator = { left = "", right = "" },
            },
          },
        },
      }
    end,
  },
}
