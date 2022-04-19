vim.cmd [[
  if exists('g:neovide')
    set background=light
    let g:everforest_background="soft"
    colorscheme everforest
  else
    let g:tokyonight_style="night"
    colorscheme tokyonight
  endif
]]
