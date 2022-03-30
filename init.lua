local modules = {
  "user.options",
  "user.keymaps",
  "user.plugins",
  "user.colorscheme",
  "user.cmp",
  "user.lsp",
  "user.telescope",
  "user.treesitter",
  "user.autopairs",
  "user.comment",
  "user.gitsigns",
  "user.nvim-tree",
  "user.bufferline",
  "user.lualine",
  "user.toggleterm",
  "user.project",
  "user.impatient",
  "user.indentline",
  "user.alpha",
  "user.whichkey",
  "user.autocommands",
  "user.markdown-preview"
}

for k, v in pairs(modules) do
  package.loaded[v]=nil
  require(v)
end
