return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure {
      providers = { 'lsp', 'treesitter', 'regex' }, -- Priority order
      delay = 100, -- Delay in milliseconds
      filetypes_denylist = { -- Disable for specific filetypes
        'dirvish',
        'fugitive',
      },
      under_cursor = true, -- Highlight word under cursor
      min_count_to_highlight = 1, -- Minimum number of matches to highlight
    }
  end,
}
