return {
  "stevearc/overseer.nvim",
  config = function()
    local overseer = require("overseer")
    overseer.setup()

    -- beyond-py
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
    })

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
