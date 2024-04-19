lint:
  # Reuse the pre-commit hook to allow for manually using the fmt/clippy/test script.
  .githooks/pre-commit

init:
  git config --local core.hooksPath .githooks
