return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {style = "moon"},
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  }
}
