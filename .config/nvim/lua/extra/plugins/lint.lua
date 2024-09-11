return {
  "mfussenegger/nvim-lint",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      markdown = { "vale" },
      python = { "mypy", "flake8", "ruff" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    vim.api.nvim_create_user_command("Lint", function()
      lint.try_lint()
    end, {
      desc = "Lint current buffer",
    })
  end,
}
