return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  settings = {
        lint = {
            extendSelect = {
                "ASYNC",  -- flake8-async
                "B",  -- flake8-bugbear
                "A",  -- flake8-builtins
                "C4",  -- flake8-comprehensions
                "LOG",  -- flake8-logging
                "RET",  -- flake8-return
                "SIM",  -- flake8-simplify 
                "TD",  -- flake8-todos
                "PTH",  -- flake8-use-pathlib
                "FLY",  -- flynt
                "I",  -- isort
                "N", -- pep8-naming
                "PERF",  -- perflint
                "PGH",  -- pygrep-hooks
                "PLE",  -- pylint error
                "PLW",  -- pylint warning
                "UP",  -- pyupgrade
                "FURB",  -- refurb
                "RUF",  -- ruff
                "TRY"  -- tryceratops
            }
        }
  },
}
