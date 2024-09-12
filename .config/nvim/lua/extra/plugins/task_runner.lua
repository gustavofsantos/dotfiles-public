local register_default_tasks = function(overseer)
  overseer.register_template({
    name = "docker: kill all",
    builder = function()
      return {
        cmd = { "docker", "kill", "$(docker ps -q)" },
        components = { "default" },
        env = {},
      }
    end
  })
end


local register_payment_tasks = function(overseer)
  overseer.register_template({
    name = "payment: start dev server",
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
    condition = {
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: start production session",
    builder = function()
      return {
        cmd = { "start-beyond-payments-session.sh" },
        components = { "default" },
        cwd = "/opt/loggi/beyond-payment/",
      }
    end,
    condition = {
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: format (ruff)",
    builder = function()
      return {
        cmd = { "poetry@payment-api" },
        args = { "run", "ruff", "format", "." },
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = {},
      }
    end,
    condition = {
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: lint (ruff)",
    builder = function()
      return {
        cmd = { "poetry@payment-api" },
        args = { "run", "ruff", "check", "--fix", "." },
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = {},
      }
    end,
    condition = {
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: lint (mypy)",
    builder = function()
      return {
        cmd = { "poetry@payment-api" },
        args = { "run", "mypy", "." },
        cwd = "/opt/loggi/beyond-payment/",
        components = { "default" },
        env = {},
      }
    end,
    condition = {
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: run migrations",
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
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: run migrations (test)",
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
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: run migrations down",
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
      dir = "/opt/loggi/beyond-payment/",
    },
  })

  overseer.register_template({
    name = "payment: run migrations down (test)",
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
      dir = "/opt/loggi/beyond-payment/",
    },
  })
end

local register_beyond_tasks = function(overseer)
  overseer.register_template({
    name = "beyond: run tests",
    builder = function()
      return {
        cmd = { "poetry", "run", "pytest", "-vv", "-x", "--disable-warnings", "--ds", "beyond_app.settings.test" },
        args = { "src/beyond_app" },
        cwd = "/opt/loggi/py/apps/beyond/",
        components = { "default" },
        env = {
          POSTGRES_DB = "dev_db",
          POSTGRES_PASSWORD = "postgres",
          POSTGRES_HOST = "localhost",
          POSTGRES_PORT = "5432",
        },
      }
    end,
    condition = {
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond: launch production shell",
    builder = function()
      return {
        cmd = { "start-beyond-session.sh" },
        cwd = "/opt/loggi/py/apps/beyond/",
        components = { "default" },
      }
    end,
    condition = {
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond: run flake8",
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
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond: run black check",
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
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond: run black format",
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
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })

  overseer.register_template({
    name = "beyond: build proto",
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
      dir = "/opt/loggi/py/apps/beyond/",
    },
  })
end

return {
  "stevearc/overseer.nvim",
  config = function()
    local overseer = require("overseer")
    overseer.setup({
      -- strategy = "toggleterm",
    })
    register_beyond_tasks(overseer)
    register_payment_tasks(overseer)
    register_default_tasks(overseer)

    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local overseer = require("overseer")
      local tasks = overseer.list_tasks({ recent_first = true })
      if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], "restart")
      end
    end, {})

    vim.keymap.set("n", "<leader>rr", "<cmd>OverseerRun<cr>", { desc = "run", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>rl", "<cmd>OverseerRestartLast<cr>",
      { desc = "run last", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>rt", "<cmd>OverseerToggle<cr>",
      { desc = "toggle task runner", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ro", "<cmd>OverseerToggle<cr>",
      { desc = "toggle task runner", noremap = true, silent = true })
  end,
}
