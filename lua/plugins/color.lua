return {
  "folke/tokyonight.nvim",
  opts = {
    on_highlights = function(highlights)
      highlights.Comment = { fg = "#7a84ad", italic = true }
      highlights.LineNr = { fg = "#6f78a8" }
      highlights.LineNrAbove = { fg = "#6f78a8" }
      highlights.LineNrBelow = { fg = "#6f78a8" }
    end,
  },
}
