return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      require('kanagawa').setup({
        transparent = true,
        theme = "wave",
        background = {
          dark = "wave",
          light = "wave",
        }
      })
      -- load the colourscheme
      vim.cmd([[colorscheme kanagawa]])
    end,
  }
}
