-- lazy.nvim plugin manager bootstrap and plugin loader

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  -- Core editor functionality
  require 'plugins.editor',

  -- UI and visual enhancements
  require 'plugins.ui',

  -- Navigation and fuzzy finding
  require 'plugins.navigation',

  -- LSP and diagnostics
  require 'plugins.lsp',

  -- Code formatting
  require 'plugins.formatting',

  -- Autocompletion
  require 'plugins.completion',

  -- Git integration
  require 'plugins.git',

  -- Indentation guides
  require 'plugins.indent',

  -- Linting
  require 'plugins.lint',

  -- Auto-close brackets
  require 'plugins.autopairs',

  -- Custom plugins
  require 'plugins.custom.oil',
  require 'plugins.custom.lazygit',
  require 'plugins.custom.highlight-colors',
}, {
  lockfile = vim.fn.stdpath 'data' .. '/lazy-lock.json',
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
