local timer_id

local update_interval = 3000

local last_os_colorscheme = ""

local set_light_colorscheme = function ()
  vim.cmd("Catppuccin latte")
end
local set_dark_colorscheme = function ()
  vim.cmd("Catppuccin macchiato")
end

local function check_current_color_scheme_preference()
  local result = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme")
  print(result)
  if result == last_os_colorscheme then return end

  if result == "prefer-light" then
    set_light_colorscheme()
  end
  if result == "prefer-dark" then
    set_dark_colorscheme()
  end
  last_os_colorscheme = result
end

local function start_check_timer()
  timer_id = vim.fn.timer_start(update_interval, function()
    check_current_color_scheme_preference()
  end, { ['repeat'] = -1 })
end

-- local function disable()
--   vim.fn.timer_stop(timer_id)
-- end

local function init()
  start_check_timer()
end

-- local function setup(options)
--   options = options or {}

--   if options.set_dark_colorscheme then
--     set_dark_colorscheme = options.set_dark_colorscheme
--   end

--   if options.set_light_colorscheme then
--     set_light_colorscheme = options.set_light_colorscheme
--   end

--   if options.update_interval then
--     update_interval = options.update_interval
--   end
-- end

-- init()
