return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
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
