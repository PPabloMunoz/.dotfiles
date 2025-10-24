-- Autoformat C/C++ on save using clangd
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.c', '*.cpp', '*.h' },
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
