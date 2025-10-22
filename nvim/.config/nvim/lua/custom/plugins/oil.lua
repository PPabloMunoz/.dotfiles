return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
      -- 'permissions',
      -- 'size',
      -- 'mtime',
    },
    delete_to_trash = true,
    keymaps = {
      ['g?'] = { 'actions.show_help', mode = 'n' },
      ['<CR>'] = 'actions.select',
      ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-t>'] = { 'actions.select', opts = { tab = true } },
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = { 'actions.close', mode = 'n' },
      ['<C-l>'] = 'actions.refresh',
      ['-'] = { 'actions.parent', mode = 'n' },
      ['_'] = { 'actions.open_cwd', mode = 'n' },
      ['`'] = { 'actions.cd', mode = 'n' },
      ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      ['gs'] = { 'actions.change_sort', mode = 'n' },
      ['gx'] = 'actions.open_external',
      ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      preview_split = 'auto',
    },
    preview_win = {
      update_on_cursor_moved = true,
    },
  },
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}

-- return {
--   {
--     'stevearc/oil.nvim',
--     dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-mini/mini.icons' },
--     config = function()
--       CustomOilBar = function()
--         local path = vim.fn.expand '%'
--         path = path:gsub('oil://', '')
--
--         return '  ' .. vim.fn.fnamemodify(path, ':.')
--       end
--
--       require('oil').setup {
--         columns = { 'icon' },
--         keymaps = {
--           ['<C-h>'] = false,
--           ['<C-l>'] = false,
--           ['<C-k>'] = false,
--           ['<C-j>'] = false,
--           ['<M-h>'] = 'actions.select_split',
--         },
--         win_options = {
--           winbar = '%{v:lua.CustomOilBar()}',
--         },
--         view_options = {
--           show_hidden = true,
--           is_always_hidden = function(name, _)
--             local folder_skip = { 'dev-tools.locks', 'dune.lock', '_build' }
--             return vim.tbl_contains(folder_skip, name)
--           end,
--         },
--       }
--
--       -- Open parent directory in current window
--       vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
--
--       -- Open parent directory in floating window
--       vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
--     end,
--   },
-- }
