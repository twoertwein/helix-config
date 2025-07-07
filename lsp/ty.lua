return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", ".git" },
  on_attach = function(client, bufnr)
    -- show type annotations
    vim.lsp.inlay_hint.enable(true, {  bufnr })
    -- extend keys that trigger auto-trigger
    local chars = { " ", "(", ",", "." };
    for i = 65, 90 do table.insert(chars, string.char(i)) end  -- A-Z
    for i = 97, 122 do table.insert(chars, string.char(i)) end  -- a-z
    client.server_capabilities.completionProvider.triggerCharacters = chars
    -- automatically trigger completions
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    -- ctrl+t to jump to the type definition
    vim.keymap.set('n', '<c-t>', vim.lsp.buf.type_definition, { buffer = bufnr })
  end,
}
