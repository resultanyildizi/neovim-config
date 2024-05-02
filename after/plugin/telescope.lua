require('telescope').setup {
  defaults = {
    preview = {
      treesitter = false
    },
    file_ignore_patterns = {
      "packer_compiled.lua",
      "%.compiled"
    }
  }
}

local builtin = require('telescope.builtin')

function FindFiles()
  local ok, _ = pcall(function() builtin.git_files({ show_untracked = true }) end)

  if (ok) then return end

  local currBuff = vim.loop.cwd()
  local prompt = "Are you sure to find files on " .. currBuff .. "? (y/N) > "
  local confirm = vim.fn.input(prompt)
  if (confirm ~= "y") then return end

  builtin.find_files()
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', FindFiles)

vim.keymap.set('n', '<C-f>', function()
  builtin.live_grep();
end)
