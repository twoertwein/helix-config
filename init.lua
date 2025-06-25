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
vim.cmd("filetype plugin indent on")
vim.cmd.colorscheme("desert")
-- slightly darker background than "desert"
vim.cmd("hi Normal guibg=#303030")
vim.cmd("hi EndOfBuffer guibg=#303030")

-- spell checking 
vim.opt.spell = true
vim.opt.spelllang = { "en" }

-- easily switch to normal mode from terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- run LSP on Ctrl+space
vim.keymap.set("i", "<c-space>", function()
  vim.lsp.completion.get()
end)

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

-- completion: do not auto-insert the first hit
vim.cmd[[set completeopt+=menuone,noselect,popup]]

-- show hover information after 2s (default 4s)
vim.opt.updatetime = 2000
vim.api.nvim_create_autocmd( { "CursorHold" }, {
    pattern = {"*.py"},
    callback = function()
       vim.lsp.buf.hover()
    end
})
