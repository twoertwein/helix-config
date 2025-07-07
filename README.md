# Very simple nvim configuration

Mostly using builtins (+ruff and ty).

## File management

- `:e <path>` to open a file (supports tab completion)
- `:b <buffer>` switch to an already opened buffer (supports tab completion)
- `:bd` close current buffer

## Completion

- `Ctrl+x+n` keyword completion
- `Ctrl+space` LSP completion (ruff/ty)
- `Ctrl+x+f` path completion
- `Ctrl+x+s` spell checking completion
- `Ctrl+t` Go to type definition (ty)
