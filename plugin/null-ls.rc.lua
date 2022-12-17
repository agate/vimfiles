local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
  },
})

vim.cmd("autocmd BufWritePost * lua vim.lsp.buf.formatting_seq_sync()")
