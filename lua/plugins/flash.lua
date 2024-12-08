return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>ff", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "[F]ind with [F]lash" },
      { "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "[F]ind with Flash ([T]reesitter)" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
