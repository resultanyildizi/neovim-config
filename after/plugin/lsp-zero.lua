local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()


local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>a<space>", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setqflist() end, opts)
  -- Use custom formatting function
  vim.cmd([[
    augroup LspFormat
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua Format()
    augroup END
  ]])
end

function Format()
  if vim.bo.filetype == 'markdown' then
    vim.cmd('silent Neoformat prettier')
  else
    vim.lsp.buf.format()
  end
end

lsp.preset('recommended')

--lsp.ensure_installed({
--'tsserver',
--'eslint',
--})

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    },
    { { name = 'buffer' }, }),
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-j>'] = cmp_action.luasnip_jump_forward(),
    ['<C-k>'] = cmp_action.luasnip_jump_backward(),
  }
})

-- configure dartls
-- dart language

local project_root_func = lspconfig.util.root_pattern('pubspec.yaml')
local project_root = project_root_func(vim.fn.expand('%:p:h'))

-- if project_contains storynowai then width = 160 else width = 80

local line_length = 80
if project_root then
  if string.match(project_root, 'storynowai') or string.match(project_root, 'mospy') then
    line_length = 120
  else
    line_length = 80
  end
end

print(line_length)

lspconfig.dartls.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern('pubspec.yaml'),
  settings = {
    dart = {
      analysisExcludedFolders = {
        vim.fn.expand('$HOME/AppData/Local/Pub/Cache'),
        vim.fn.expand('$HOME/.pub-cache'),
        vim.fn.expand('/opt/homebrew/'),
        vim.fn.expand('usr/local/flutter/'),
      },
      lineLength = line_length,
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = true,
      enableSnippets = true,
    }
  },
}

-- configure clangd
-- c language
lspconfig.clangd.setup {
  on_attach = on_attach,
}

-- configure gopls
-- go language
lspconfig.gopls.setup {
  on_attach = on_attach,
}

-- configure pyright
-- python language
lspconfig.pyright.setup {
  on_attach = on_attach,
}

-- configure lua_ls
-- lua language
lspconfig.lua_ls.setup {
  on_attach = on_attach,
}

-- configure marksman
-- markdown language
lspconfig.marksman.setup {
  on_attach = on_attach,
}




lsp.setup()
