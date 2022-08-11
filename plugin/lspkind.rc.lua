local status, lspkind = pcall(require, 'lspkind')
if (not status) then return end

local cmp = require('cmp')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50,
    })
  }
}
