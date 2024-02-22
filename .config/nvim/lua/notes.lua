local journals_dir = "~/notes/journal"
local zettelkasten_dir = "~/notes/z"

local function today_date()
  return os.date("%Y-%m-%d")
end

local function open_daily_journal()
  vim.cmd(string.format("e %s/%s.md", journals_dir, today_date()))
end

local function open_worklog()
  vim.cmd("vsp | e ~/notes/worklog.md")
end

local function open_new_zk_note()
  vim.cmd(string.format("e %s/%s.md", zettelkasten_dir, os.date("%Y%m%d%H%M%S")))
end

vim.keymap.set("n", "<leader>jd", open_daily_journal, { noremap = true, silent = true, desc = "Open daily journal" })
vim.keymap.set("n", "<leader>jw", open_worklog, { noremap = true, silent = true, desc = "Open worklog" })
vim.keymap.set(
  "n",
  "<leader>jz",
  open_new_zk_note,
  { noremap = true, silent = true, desc = "Open new Zettelkasten note" }
)
