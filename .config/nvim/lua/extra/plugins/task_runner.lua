local register_payment_tasks = function(overseer)
  overseer.register_template({
    name = "payment - start dev server",
    builder = function()
      return {
        cmd = { "poetry@payment-api" },
        args = { "run", "uvicorn", "app.main:app", "--host", "0.0.0.0",
          "--port", "8000", "--workers", "1", "--no-access-log", "--reload" },
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = {},
      }
    end,
  })

  overseer.register_template({
    name = "payment - format (ruff)",
    builder = function()
      return {
        cmd = { "poetry@payment-api" },
        args = { "run", "ruff", "format", "." },
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = {},
      }
    end,
  })

  overseer.register_template({
    name = "payment - lint (ruff)",
    builder = function()
      return {
        cmd = { "poetry@payment-api" },
        args = { "run", "ruff", "check", "--fix", "." },
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = {},
      }
    end,
  })

  overseer.register_template({
    name = "payment - lint (mypy)",
    builder = function()
      return {
        cmd = { "poetry@payment-api" },
        args = { "run", "mypy", "." },
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = {},
      }
    end,
  })

  overseer.register_template({
    name = "payment - run migrations",
    builder = function()
      return {
        cmd = { "poetry@payment-api", "run", "alembic", "upgrade", "head" },
        args = {},
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = { APP_DB_HOST = "localhost" },
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment - run migrations (test)",
    builder = function()
      return {
        cmd = { "poetry@payment-api", "run", "alembic", "-x", "env=test", "upgrade", "head" },
        args = {},
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = { APP_DB_HOST = "localhost" },
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment - run migrations down",
    builder = function()
      return {
        cmd = { "poetry@payment-api", "run", "alembic", "downgrade", "-1" },
        args = {},
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = { APP_DB_HOST = "localhost" },
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment - run migrations down (test)",
    builder = function()
      return {
        cmd = { "poetry@payment-api", "run", "alembic", "-x", "env=test", "downgrade", "-1" },
        args = {},
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = { APP_DB_HOST = "localhost" },
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/beyond-payment/",
    },
  })
end

local register_beyond_tasks = function(overseer)
  overseer.register_template({
    name = "beyond - run flake8",
    builder = function(params)
      return {
        cmd = { "poetry", "run", "flake8" },
        args = {},
        cwd = "/opt/loggi/py/apps/beyond/",
        components = { "default" },
        env = {},
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond - run black check",
    builder = function(params)
      return {
        cmd = { "poetry", "run", "black" },
        args = { "--check", "." },
        cwd = "/opt/loggi/py/apps/beyond/",
        components = { "default" },
        env = {},
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond - run black format",
    builder = function(params)
      return {
        cmd = { "poetry", "run", "black" },
        args = { "." },
        cwd = "/opt/loggi/py/apps/beyond/",
        components = { "default" },
        env = {},
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond - build proto",
    builder = function()
      return {
        cmd = { "poetry", "run", "python" },
        args = { "../../libs/buildproto.py", "apps/beyond/src/proto" },
        cwd = "/opt/loggi/py/apps/beyond/",
        components = { "default" },
        env = {},
      }
    end,
    condition = {
      filetype = "python",
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })
end

return {
  "stevearc/overseer.nvim",
  config = function()
    local overseer = require("overseer")
    overseer.setup()
    register_beyond_tasks(overseer)
    register_payment_tasks(overseer)

    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local overseer = require("overseer")
      local tasks = overseer.list_tasks({ recent_first = true })
      if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], "restart")
      end
    end, {})
  end,
  keys = {
    { "<leader>rr", "<cmd>OverseerRun<cr>",         { desc = "Run", noremap = true, silent = true } },
    { "<leader>rl", "<cmd>OverseerRestartLast<cr>", { desc = "Run last", noremap = true, silent = true } },
    { "<leader>rt", "<cmd>OverseerToggle<cr>",      { desc = "Toggle Overseer", noremap = true, silent = true } },
    { "<leader>ro", "<cmd>OverseerToggle<cr>",      { desc = "Toggle Overseer", noremap = true, silent = true } },
  },
}
