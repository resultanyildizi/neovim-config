local map = vim.keymap.set
local opts = { noremap = false, silent = true }

-- Move to previous/next
map('n', 'g,', vim.cmd.BufferPrevious, opts)
map('n', 'g.', vim.cmd.BufferNext, opts)
-- Re-order to previous/next
map('n', 'g<', vim.cmd.BufferMovePrevious, opts)
map('n', 'g>', vim.cmd.BufferMoveNext, opts)
-- Goto buffer in position...
map('n', 'g1', function() vim.cmd.BufferGoto(1) end, opts)
map('n', 'g2', function() vim.cmd.BufferGoto(2) end, opts)
map('n', 'g3', function() vim.cmd.BufferGoto(3) end, opts)
map('n', 'g4', function() vim.cmd.BufferGoto(4) end, opts)
map('n', 'g5', function() vim.cmd.BufferGoto(5) end, opts)
map('n', 'g6', function() vim.cmd.BufferGoto(6) end, opts)
map('n', 'g7', function() vim.cmd.BufferGoto(7) end, opts)
map('n', 'g8', function() vim.cmd.BufferGoto(8) end, opts)
map('n', 'g9', function() vim.cmd.BufferGoto(9) end, opts)
map('n', 'g0', vim.cmd.BufferLast, opts)
-- Close buffer
map('n', 'gc', vim.cmd.BufferClose, opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', 'gp', vim.cmd.BufferPick, opts)
-- Pin/unpin buffer
map('n', 'grp', vim.cmd.BufferPin, opts)
-- Sort automatically by...

map('n', '<Space>bb', vim.cmd.BufferOrderByBufferNumber, opts)
map('n', '<Space>bd', vim.cmd.BufferOrderByDirectory, opts)
map('n', '<Space>bl', vim.cmd.BufferOrderByLanguage, opts)
map('n', '<Space>bw', vim.cmd.BufferOrderByWindowNumber, opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
