return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", ".git" },
  on_attach = function(client, bufnr)
    -- show type annotations
    vim.lsp.inlay_hint.enable(true, {  bufnr })
    -- automatically trigger completions
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub("%b()", "") }
      end,
    })
  end,
}
