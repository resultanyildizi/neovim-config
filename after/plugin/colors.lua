 require('rose-pine').setup({
   variant = 'auto',
   dark_variant = 'moon'
 })

require('nightfox').setup({
 options = {
 	terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
 	dim_inactive = false, -- Non focused panes set to alternative background
 }
})


function SetBackgroundColor()
    local hour = tonumber(os.date("%H"))
    if (hour >= 8 and hour < 18) then
      print('Setting background to light')
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'rose-pine'
      vim.opt.background = 'light'
    else
      print('Setting background to dark')
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'gruvbox'
      vim.opt.background = 'dark'
      --vim.cmd.colorscheme 'catppuccin-frappe'
      --vim.cmd.colorscheme 'duskfox'
      --vim.cmd.colorscheme 'rose-pine'
    end
end
 
SetBackgroundColor()
