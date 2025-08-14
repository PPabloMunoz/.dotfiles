-- lua/plugins/snacks-explorer.lua
return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}

      -- Extend ONLY the Explorer source, keep the rest of your config intact
      local ex = opts.picker.sources.explorer or {}

      -- Close the explorer after confirming a file
      ex.auto_close = true

      -- Map `l` in the list window to the default confirm action (open file / expand dir)
      ex.win = ex.win or {}
      ex.win.list = ex.win.list or {}
      ex.win.list.keys = vim.tbl_extend("force", ex.win.list.keys or {}, {
        ["l"] = { "confirm" },
      })

      opts.picker.sources.explorer = ex
    end,
  },
}
