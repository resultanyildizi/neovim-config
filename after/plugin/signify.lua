-- signify_vcs_cmds
-- signify_vcs_cmds_diffmode
-- signify_disable_by_default
-- signify_skip
-- signify_skip_filetype
-- signify_skip_filename
-- signify_skip_filename_pattern
-- signify_line_highlight
-- signify_number_highlight
-- signify_sign_add
-- signify_sign_delete
-- signify_sign_delete_first_line
-- signify_sign_change
-- signify_sign_change_delete
-- signify_sign_show_count
-- signify_difftool
-- signify_fold_context
-- signify_priority

-- Customize sign column symbols
vim.g.signify_sign_add = "+"
vim.g.signify_sign_delete = "-"
vim.g.signify_sign_change = "~"

vim.keymap.set("n", "<C-s>t", vim.cmd.SignifyToggleHighlight)
vim.keymap.set("n", "<C-s>u", vim.cmd.SignifyHunkUndo)
vim.keymap.set("n", "<C-s>d", vim.cmd.SignifyHunkDiff)
