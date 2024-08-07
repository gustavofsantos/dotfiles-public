local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local themes = require("telescope.themes")
local conf = require("telescope.config").values
local log = require("plenary.log").new({})
log.level = "debug"

local categories = {
  action = "",
  navigation = "",
  vcs = "",
  lsp = "󰀫",
  problem = "",
}

local mappings = {
  { "Find files", cmd = "Telescope find_files", category = "navigation" },
  { "Recent files", cmd = "Telescope oldfiles", category = "navigation" },
  { "Open files", cmd = "Telescope buffers", category = "navigation" },
  { "Recent locations", cmd = "Telescope jumplist theme=dropdown", category = "navigation" },
  { "Text search", cmd = "Telescope current_buffer_fuzzy_find theme=dropdown", category = "navigation" },
  { "Workspace text search", cmd = "Telescope live_grep", category = "navigation" },
  { "Commits", cmd = "Telescope git_commits", category = "navigation" },
  { "Branches", cmd = "Telescope git_branches", category = "navigation" },
  { "Symbols", cmd = "Telescope lsp_document_symbols", category = "navigation" },
  { "Classes", cmd = "Telescope lsp_document_symbols symbols=class", category = "navigation" },
  { "Functions", cmd = "Telescope lsp_document_symbols symbols=function", category = "navigation" },
  { "Variables", cmd = "Telescope lsp_document_symbols symbols=variable", category = "navigation" },
  { "Workspace symbols", cmd = "Telescope lsp_workspace_symbols", category = "navigation" },

  -- version control actions
  { "Commit", cmd = "Git commit", category = "vcs" },
  { "Pull", cmd = "Git pull", category = "vcs" },
  { "Push", cmd = "Git push", category = "vcs" },
  { "Blame", cmd = "Git blame", category = "vcs" },
  { "Stage hunk", cmd = "Gitsigns stage_hunk", category = "vcs" },
  { "Stage buffer", cmd = "Git add %", category = "vcs" },
  { "Reset hunk", cmd = "Gitsigns reset_hunk", category = "vcs" },
  { "Reset buffer", cmd = "Gitsigns reset_buffer", category = "vcs" },
  { "Preview hunk", cmd = "Gitsigns preview_hunk", category = "vcs" },

  -- problem actions
  { "Buffer diagnostics", cmd = "Telescope diagnostics bufnr=0", category = "problem" },
  { "Workspace diagnostics", cmd = "Telescope diagnostics", category = "problem" },

  -- basic actions
  { "Split window", cmd = "vsplit", category = "action" },
  { "Split window below", cmd = "split", category = "action" },
  { "Disable formatting", cmd = "FormatDisable", category = "action" },
  { "Enable formatting", cmd = "FormatEnable", category = "action" },
  { "Run", cmd = "OverseerRun", category = "action" },
  { "Runs", cmd = "OverseerToggle", category = "action" },
  { "New tab", cmd = "tabnew", category = "action" },
  { "Run file", cmd = "!%", category = "action" },
  { "Close buffer", cmd = "bd", category = "action" },
  { "Quit", cmd = "q", category = "action" },
}

local dropdown_theme = themes.get_dropdown({})

---@param cmd string
local execute_cmd = function(cmd)
  vim.cmd(cmd)
end

---@param category string
local get_category_icon = function(category)
  return categories[category] or ""
end

local launch_control = function()
  local opts = {}

  for _, option in ipairs(mappings) do
    if option.nkeymap then
      local keymap = option.nkeymap
      local cmd = option.cmd
      if type(cmd) == "string" then
        vim.api.nvim_set_keymap("n", keymap, "<cmd> " .. cmd .. "<CR>", { noremap = true, silent = true })
      end
    end
  end

  pickers
    .new(dropdown_theme, {
      prompt_title = "Launch Control",
      prompt_prefix = " ",
      sorter = conf.generic_sorter(opts),
      finder = finders.new_table({
        results = mappings,
        entry_maker = function(option)
          return {
            value = option,
            display = get_category_icon(option.category) .. " " .. option[1],
            ordinal = option[1],
            cmd = option.cmd,
          }
        end,
      }),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if type(selection.cmd) == "function" then
            selection.cmd(opts)
          else
            execute_cmd(selection.cmd)
          end
        end)

        return true
      end,
    })
    :find()
end

vim.api.nvim_create_user_command("LaunchControl", launch_control, {})
