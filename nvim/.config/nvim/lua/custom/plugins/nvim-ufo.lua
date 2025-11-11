return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'VeryLazy', -- Lazy-load on VeryLazy event for performance
  config = function()
    -- Basic setup (calls ufo.setup() with defaults)
    local ufo = require 'ufo'
    ufo.setup()

    -- Optional: Set fold options (uncomment if needed)
    -- vim.opt.foldcolumn = '1' -- Show fold column
    vim.opt.foldlevel = 99 -- Start with no folds closed
    vim.opt.foldlevelstart = 99

    -- Optional: Keymaps for folding (overrides default z* keys)
    vim.keymap.set('n', 'zR', ufo.openAllFolds)
    vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
    vim.keymap.set('n', 'zm', ufo.closeFoldsWith) -- Close all folds except current

    -- Optional: LSP integration (assumes you have nvim-lspconfig)
    -- Add this after your LSP setup in your lsp config file
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if ft == 'json' then
          require('ufo').setup { provider = 'lsp' }
        else
          require('ufo').setup { provider = { 'treesitter', 'indent', 'lsp' } }
        end
      end,
    })
  end,
}
