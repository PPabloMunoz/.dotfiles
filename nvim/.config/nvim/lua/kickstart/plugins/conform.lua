return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>mp',
      function()
        require('conform').format { async = false, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.

      -- local disable_filetypes = { c = true, cpp = true }
      -- if disable_filetypes[vim.bo[bufnr].filetype] then
      --   return nil
      -- else
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
        async = false,
      }
      -- end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'gofumpt' },
      javascript = { 'biome' },
      typescript = { 'biome' },
      javascriptreact = { 'biome' },
      typescriptreact = { 'biome' },
      json = { 'biome', 'prettierd' },
      jsonc = { 'biome', 'prettierd' },
      toml = { 'taplo' },
    },
  },
}
