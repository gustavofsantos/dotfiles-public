local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local themes = require("telescope.themes")
local conf = require("telescope.config").values
local utils = require("utils")

local categories = {
  action = "",
  navigation = "",
  vcs = "",
  lsp = "󰀫",
  problem = "",
}

local mappings = {
  { "Find files",            desc = "Find files in the current directory",            cmd = "Telescope find_files",                category = "navigation" },
  { "Recent files",          desc = "Find recent opened files",                       cmd = "Telescope oldfiles",                  category = "navigation" },
  { "Open files",            desc = "Find buffers",                                   cmd = "Telescope buffers",                   category = "navigation" },
  { "Recent locations",      cmd = "Telescope jumplist",                              category = "navigation" },
  { "Text search",           desc = "Fuzzy search grep files",                        cmd = "Telescope current_buffer_fuzzy_find", category = "navigation" },
  { "Workspace text search", cmd = "Telescope live_grep",                             category = "navigation" },
  { "Commits",               cmd = "Telescope git_commits",                           category = "navigation" },
  { "Branches",              cmd = "Telescope git_branches",                          category = "navigation" },
  { "Symbols",               cmd = "Telescope lsp_document_symbols",                  category = "navigation" },
  { "Classes",               cmd = "Telescope lsp_document_symbols symbols=class",    category = "navigation" },
  { "Functions",             cmd = "Telescope lsp_document_symbols symbols=function", category = "navigation" },
  { "Variables",             cmd = "Telescope lsp_document_symbols symbols=variable", category = "navigation" },
  { "Workspace symbols",     cmd = "Telescope lsp_workspace_symbols",                 category = "navigation" },
  { "Keymapping",            cmd = "Telescope keymaps",                               category = "navigation" },
  { "Commands",              cmd = "Telescope commands",                              category = "navigation" },
  { "Registers",             cmd = "Telescope registers",                             category = "navigation" },
  { "Search history",        cmd = "Telescope search_history",                        category = "navigation" },
  { "Help tags",             cmd = "Telescope help_tags",                             category = "navigation" },

  -- version control actions
  { "Git status",            cmd = "Git",                                             category = "vcs" },
  { "Git commit",            cmd = "Git commit",                                      category = "vcs" },
  { "Git pull",              cmd = "Git pull",                                        category = "vcs" },
  { "Git push",              cmd = "Git push",                                        category = "vcs" },
  { "Git blame",             cmd = "Git blame",                                       category = "vcs" },
  { "Stage hunk",            cmd = "Gitsigns stage_hunk",                             category = "vcs" },
  { "Stage buffer",          cmd = "Git add %",                                       category = "vcs" },
  { "Reset hunk",            cmd = "Gitsigns reset_hunk",                             category = "vcs" },
  { "Reset buffer",          cmd = "Gitsigns reset_buffer",                           category = "vcs" },
  { "Preview hunk",          cmd = "Gitsigns preview_hunk",                           category = "vcs" },

  -- problem actions
  { "Buffer diagnostics",    cmd = "Telescope diagnostics bufnr=0",                   category = "problem" },
  { "Workspace diagnostics", cmd = "Telescope diagnostics",                           category = "problem" },

  -- basic actions
  { "Split window",          cmd = "vsplit",                                          category = "action" },
  { "Split window below",    cmd = "split",                                           category = "action" },
  { "Disable formatting",    cmd = "FormatDisable",                                   category = "action" },
  { "Enable formatting",     cmd = "FormatEnable",                                    category = "action" },
  { "Format file",           cmd = "echo 'todo'",                                     category = "action" },
  { "Toggle background",     desc = "Toggle beween dark or light background",         cmd = utils.toggle_background,               category = "action" },
  { "Run",                   cmd = "OverseerRun",                                     category = "action" },
  { "Runs",                  cmd = "OverseerToggle",                                  category = "action" },
  { "New tab",               cmd = "tabnew",                                          category = "action" },
  { "New file",              cmd = "enew",                                            category = "action" },
  { "Run file",              cmd = "!%",                                              category = "action" },
  { "Close buffer",          cmd = "bd",                                              category = "action" },
  { "Quit",                  cmd = "q",                                               category = "action" },
  { "Reload config",         cmd = "Lazy reload",                                     category = "action" },
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
              ordinal = option[1] .. " " .. (option.desc or ""),
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

local M = {}

M.launch_control = launch_control

return M
