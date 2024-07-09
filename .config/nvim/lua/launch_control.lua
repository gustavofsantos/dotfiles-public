local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local themes = require("telescope.themes")
local conf = require("telescope.config").values

local mappings = {}

local icons = {
  file = " ",
  vcs = "",
  lsp = "󰀫",
  problem = " "
}

mappings.navigation = {
  { "Find files",        cmd = "Telescope find_files",            tag = "file" },
  { "Recent files",      cmd = "Telescope oldfiles",              tag = "file" },
  { "Open files",        cmd = "Telescope buffers",               tag = "file" },
  { "Commits",           cmd = "Telescope git_commits",           tag = "vcs" },
  { "Branches",          cmd = "Telescope git_branches",          tag = "vcs" },
  { "Symbols",           cmd = "Telescope lsp_document_symbols",  tag = "lsp" },
  { "Workspace symbols", cmd = "Telescope lsp_workspace_symbols", tag = "lsp" },
}

mappings.vcs = {
  { "Commit",       cmd = "Git commit",            tag = "vcs" },
  { "Pull",         cmd = "Git pull",              tag = "vcs" },
  { "Push",         cmd = "Git push",              tag = "vcs" },
  { "Blame",        cmd = "Git blame",             tag = "vcs" },
  { "Stage hunk",   cmd = "Gitsigns stage_hunk",   tag = "vcs" },
  { "Stage buffer", cmd = "Git add %",             tag = "vcs" },
  { "Reset hunk",   cmd = "Gitsigns reset_hunk",   tag = "vcs" },
  { "Reset buffer", cmd = "Gitsigns reset_buffer", tag = "vcs" },
  { "Preview hunk", cmd = "Gitsigns preview_hunk", tag = "vcs" },
}

mappings.problems = {
  { "Buffer diagnostics",    cmd = "Telescope diagnostics bufnr=0", tag = "problem" },
  { "Workspace diagnostics", cmd = "Telescope diagnostics",         tag = "problem" },
}

local dropdown_theme = themes.get_dropdown({})

--@param cmd string
local execute_cmd = function(cmd)
  vim.cmd(cmd)
end

local create_submenu_picker = function(opts, cfg)
  opts = opts or {}
  print("create submenu picker" .. vim.inspect(cfg.mappings))
  return pickers.new(dropdown_theme, {
    prompt_title = cfg.prompt_title or "Launch Control",
    sorter = conf.generic_sorter(opts),
    finder = finders.new_table({
      results = cfg.mappings,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
          cmd = entry.cmd
        }
      end
    }),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        execute_cmd(selection.cmd)
      end)

      return true
    end
  }):find()
end

local new_options = function()
  return {
    {
      "Find",
      exec = function(opts)
        create_submenu_picker(opts,
          { prompt_title = "Find", mappings = mappings.navigation })
      end
    },
    {
      "VCS",
      exec = function(opts)
        create_submenu_picker(opts, { prompt_title = "VCS", mappings = mappings.vcs })
      end
    },
    {
      "Problems",
      exec = function(opts)
        create_submenu_picker(opts, { prompt_title = "Problems", mappings = mappings.problems })
      end
    },
  }
end


local new_main_picker = function(opts)
  local categories = new_options()
  pickers.new(dropdown_theme, {
    prompt_title = "Launch Control",
    prompt_prefix = " ",
    sorter = conf.generic_sorter(opts),
    finder = finders.new_table({
      results = categories,
      entry_maker = function(option)
        return {
          value = option,
          display = option[1],
          ordinal = option[1],
          exec = option.exec
        }
      end
    }),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        selection.exec(opts)
      end)

      return true
    end
  }):find()
end


local launch_control = function()
  print("Run launch control")
  new_main_picker()
end

local launch_control_all = function()
  local opts = {}

  local all_options = {}
  all_options = vim.list_extend(all_options, mappings.navigation)
  all_options = vim.list_extend(all_options, mappings.vcs)
  all_options = vim.list_extend(all_options, mappings.problems)

  pickers.new(dropdown_theme, {
    prompt_title = "Launch Control",
    prompt_prefix = "🚀 ",
    sorter = conf.generic_sorter(opts),
    finder = finders.new_table({
      results = all_options,
      entry_maker = function(option)
        return {
          value = option,
          display = icons[option.tag] .. " " .. option[1],
          ordinal = option[1],
          cmd = option.cmd
        }
      end
    }),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        execute_cmd(selection.cmd)
      end)

      return true
    end
  }):find()
end

vim.api.nvim_create_user_command("LaunchControl", launch_control_all, {})
