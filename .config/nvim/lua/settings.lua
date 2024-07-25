-- neovide
if vim.g.neovide then
  vim.o.guifont = "MonoLisa Nerd Font:h10:#h-none"
  vim.opt.linespace = 0

  vim.g.neovide_theme = "auto"

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.g.neovide_transparency = 0.95
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_animation_length = 0.1

  vim.g.neovide_cursor_trail_size = 0.5
end

-- vim.opt.statusline = "%<%f"
-- vim.opt.statusline:append("%{exists('g:loaded_fugitive')?' ':''}")
-- vim.opt.statusline:append("%{exists('g:loaded_fugitive')?fugitive#statusline():''}")
-- vim.opt.statusline:append("%h%m%r%=%-14.(%l,%c%V%) %P")

vim.cmd([[
  autocmd TermOpen * setlocal nonumber norelativenumber
]])

vim.api.nvim_create_user_command(
  "Journal",
  'lua vim.cmd(string.format("tabnew ~/notes/journal/%s.md", os.date("%Y-%m-%d")))<CR>',
  { desc = "Open daily journal file", bang = true, nargs = 0 }
)

vim.api.nvim_create_user_command(
  "Worklog",
  ":vsp | :e ~/notes/worklog.md",
  { desc = "Open worklog file", bang = true, nargs = 0 }
)

vim.api.nvim_create_user_command("TaskNotes", function()
  -- Get the current git branch name
  local branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

  -- Extract the file name after the first slash, if any
  local filename = vim.fn.match("(.*)/(.+)", branch_name) or branch_name

  -- Transform the filename to uppercase
  filename = vim.fn.toupper(filename)

  -- Construct the file path
  local file_path = vim.fn.expand("~/.notes/loggi/" .. filename .. ".md")

  -- Check if the file exists and is writable
  if vim.fn.filewritable(file_path) then
    vim.cmd("e " .. file_path)
  else
    -- Create the new markdown file
    vim.cmd("enew " .. file_path)

    -- Write a header with the transformed filename
    local content = "# " .. filename .. "\n\n"
    vim.fn.setfile(file_path, content)
  end
end, { desc = "Open task notes", bang = true, nargs = 0 })
