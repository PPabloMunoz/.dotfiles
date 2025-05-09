return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle Neo-tree' },
  },
  ---@module "neo-tree"
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        never_show = { '.DS_Store', '.git' },
        hide_by_name = {
          'node_modules',
          'vendor',
        },
        always_show_by_pattern = {
          '.env*',
        },
        always_show = { -- remains visible even if other settings would normally hide it
          '.gitignore',
          '.stylua.toml',
        },
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true, -- Auto-refresh on file changes
    },
    window = {
      mappings = {
        ['l'] = 'open',
      },
    },
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
  },
}
