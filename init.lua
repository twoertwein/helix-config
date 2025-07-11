-- line numbers
vim.o.number = true

-- use spaces, not tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- line behavior
vim.o.smartindent = true
vim.o.wrap = true

-- colors
vim.cmd("syntax enable")
vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- spell checking
vim.opt.spell = true
vim.opt.spelllang = { "en" }

-- easily switch to normal mode from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- easier to remember completions
-- ctrl+space for LSP
vim.keymap.set("i", "<c-Space>", [[<C-x><C-o>]], { noremap = true, silent = true })
-- ctrl+f for file paths
vim.keymap.set("i", "<c-f>", [[<C-x><C-f>]], { noremap = true, silent = true })
-- ctrl+s for spelling
vim.keymap.set("i", "<c-s>", [[<C-x><C-s>]], { noremap = true, silent = true })

-- same navigation behavior as in other programs (alt+arrows)
vim.keymap.set("n", "<M-Right>", "w", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Left>", "b", { noremap = true, silent = true })

-- tools
vim.diagnostic.config({ virtual_lines = { current_line = true, }})
vim.lsp.enable { "ruff", "ty" }

-- fix and format
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.py" },
  callback = function()
    -- run format (sync) before code_action (async) to avoid interactions
    -- format
    vim.lsp.buf.format({ async = false })
    -- fix
    vim.lsp.buf.code_action({
      context = {
        only = { "source.fixAll.ruff" },
      },
      apply = true,
      })
  end,
})
-- remove trailing white spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- completion: do not auto-insert the first hit
vim.opt.completeopt:append({ 'menuone', 'noselect', 'popup' })
