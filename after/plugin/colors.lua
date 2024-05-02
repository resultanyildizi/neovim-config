require('rose-pine').setup({
  variant = 'auto',
  dark_variant = 'moon'
})


require('nightfox').setup({
  options = {
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
  }
})
