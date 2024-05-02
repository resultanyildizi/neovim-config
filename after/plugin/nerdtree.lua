function NERDTreeToggleOrFind()
    -- Check if NERDTree is open
    local isTreeOpen = vim.api.nvim_eval("g:NERDTree.IsOpen()") == 1

    -- Execute the corresponding command
    if isTreeOpen then
        vim.api.nvim_command("NERDTreeToggle")
    else
        vim.api.nvim_command("NERDTreeFind")
    end
end

-- Create the key mapping
vim.api.nvim_set_keymap('n', '<C-n>', ':lua NERDTreeToggleOrFind()<CR>', { noremap = true, silent = true })
