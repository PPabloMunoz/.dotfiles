return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      exclude = {
        "node_modules", -- hide node modules
        "vendor", -- hide Go vendor folder
        ".git", -- hide git folder
      },
      sources = {
        files = {
          hidden = true, -- Ensure file source shows hidden files
          ignored = true, -- Also respect gitignore for that source
        },
        explorer = {
          auto_close = true,
          win = {
            list = {
              keys = {
                ["l"] = { "confirm" },
              },
            },
          },
        },
      },
    },
  },
}
