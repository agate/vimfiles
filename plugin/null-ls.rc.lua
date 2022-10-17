local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

-- null_ls.setup({
  -- on_attach = function(client, bufnr)
    -- if client.server_capabilities.documentFormattingProvider then
      -- vim.api.nvim_command [[augroup Format]]
      -- vim.api.nvim_command [[autocmd! * <buffer>]]
      -- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      -- vim.api.nvim_command [[augroup END]]
    -- end
  -- end,
  -- sources = {
    -- require("null-ls").builtins.diagnostics.eslint,
  -- }
-- })

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})
