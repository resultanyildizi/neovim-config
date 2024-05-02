vim.g.mapleader = " "
local keyset = vim.keymap.set

keyset("n", "<leader>pv", vim.cmd.Ex)


keyset("n", "<leader>w", function() vim.cmd.wincmd("w") end)
keyset("n", "<leader>wj", function() vim.cmd.wincmd("j") end)
keyset("n", "<leader>wk", function() vim.cmd.wincmd("k") end)
keyset("n", "<leader>wl", function() vim.cmd.wincmd("l") end)
keyset("n", "<leader>wh", function() vim.cmd.wincmd("h") end)
keyset("n", "<leader>wc", function() vim.cmd.wincmd("c") end)

keyset("v", "J", ":m '>+1<CR>gv=gv")
keyset("v", "K", ":m '<-2<CR>gv=gv")

keyset("n", "J", "mzJ`z")
keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")

-- greatest remap ever
keyset("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keyset({ "n", "v" }, "<leader>y", [["+y]])
keyset("n", "<leader>Y", [["+Y]])

keyset({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
keyset("i", "<C-c>", "<Esc>")

keyset("n", "Q", "<nop>")
keyset("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Define the function to format with fallback to Neoformat + Prettier
function format_with_fallback()
    -- Attempt to format using LSP formatter
    local result = vim.lsp.buf.format()

    if not result or vim.tbl_isempty(result) then
        print('Trying to format with Neoformat')
        -- LSP formatter failed, use Neoformat with prettier as fallback
        vim.cmd('silent Neoformat prettier')
    end
end
keyset("n", "<leader>f", format_with_fallback)

keyset("n", "<C-k>", "<cmd>cnext<CR>zz")
keyset("n", "<C-j>", "<cmd>cprev<CR>zz")
keyset("n", "<leader>k", "<cmd>lnext<CR>zz")
keyset("n", "<leader>j", "<cmd>lprev<CR>zz")

keyset("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keyset("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keyset("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
keyset("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

keyset("n", "gt", "<cmd>tabnew<CR>")

-- This is about terminal
keyset("n", "<leader>nt", "<cmd>belowright split | terminal<CR>")

keyset("i", "<C-l>", "copilot#Accept('<CR>')", {noremap = true, silent = true, expr=true, replace_keycodes = false })
