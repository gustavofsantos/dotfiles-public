local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/home/gustavo-santos/.nix-profile/bin/fd"
local loggi_path = "/opt/loggi"

M.toggle = function(window, pane)
    local projects = {
        { label = "/home/gustavo-santos/.config/nvim",    id = "nvim-config" },
        { label = "/home/gustavo-santos/.config/wezterm", id = "wezterm-config" },
        { label = "/opt/loggi/py/apps/beyond/",           id = "beyond-py" }
    }

    local success, stdout, stderr = wezterm.run_child_process({
        fd,
        "-HI",
        "-td",
        "^.git$",
        "--max-depth=4",
        loggi_path,
        -- add more paths here
    })

    if not success then
        wezterm.log_error("Failed to run fd: " .. stderr)
        return
    end

    for line in stdout:gmatch("([^\n]*)\n?") do
        local project = line:gsub("/.git/$", "")
        local label = project
        local id = project:gsub(".*/", "")
        table.insert(projects, { label = tostring(label), id = tostring(id) })
    end

    window:perform_action(
        act.InputSelector({
            action = wezterm.action_callback(function(win, _, id, label)
                if not id and not label then
                    wezterm.log_info("Cancelled")
                else
                    wezterm.log_info("Selected " .. label)
                    win:perform_action(
                        act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }),
                        pane
                    )
                end
            end),
            fuzzy = true,
            title = "Select project",
            choices = projects,
        }),
        pane
    )
end

return M
