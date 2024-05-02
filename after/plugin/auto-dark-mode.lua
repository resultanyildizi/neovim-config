local auto_dark_mode = require('auto-dark-mode')
auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    print('Initializing with dark mode')
    vim.api.nvim_set_option('background', 'dark')
    vim.cmd('colorscheme ' .. DarkTheme)
  end,
  set_light_mode = function()
    print('Initializing with light mode')
    vim.api.nvim_set_option('background', 'light')
    vim.cmd('colorscheme ' .. LightTheme)
  end,
})
