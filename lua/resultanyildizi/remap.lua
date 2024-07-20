vim.g.mapleader = " "
local keyset = vim.keymap.set

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


keyset("n", "<C-k>", "<cmd>cnext<CR>zz")
keyset("n", "<C-j>", "<cmd>cprev<CR>zz")
keyset("n", "<leader>k", "<cmd>lnext<CR>zz")
keyset("n", "<leader>j", "<cmd>lprev<CR>zz")

keyset("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keyset("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
keyset("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
keyset("n", "gt", "<cmd>tabnew<CR>")

-- This is about terminal
local function open_terminal()
  vim.api.nvim_command("belowright split")
  vim.api.nvim_command("terminal")
  vim.api.nvim_command("resize 20")
end
keyset("n", "<leader>nt", open_terminal)
keyset("t", "<ESC>", "<C-\\><C-n>", { noremap = true })

-- Change the pane size
local function is_right_most_pane()
  local current_win = vim.fn.winnr()
  local rightmost_win = vim.fn.winnr('$')
  return current_win == rightmost_win
end
local function resize_accordingly(key)
  local is_right_most = is_right_most_pane()
  local accumulator = 5
  local sign = '+'
  if ((key == 'left' and not is_right_most) or (key == 'right' and is_right_most)) then
    sign = '-'
  end
  vim.api.nvim_command("vertical resize " .. sign .. accumulator)
end
keyset("n", "<leader>l", function() resize_accordingly('right') end)
keyset("n", "<leader>h", function() resize_accordingly('left') end)

keyset("i", "<C-l>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true, replace_keycodes = false })
