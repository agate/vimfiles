lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- one of "all", "maintained" (parsers with maintainers)
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
  },
}
EOF
