local has_conflict, conflict = pcall(require, 'git-conflict')
if (has_conflict) then
  conflict.setup {}
end

--[[
  Mappings
    co - choose ours
    ct - choose theirs
    cb - choose both
    c0 - choose none
    ]x - move to previous conflict
    [x - move to next conflict
--]]

local has_gitsigns, gitsigns = pcall(require, 'gitsigns')
if (has_gitsigns) then
  gitsigns.setup {
    signcolumn = true,
    numhl = false,
    linehl= false,
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d>',
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    }
  }
end

local has_diffview, diffview = pcall(require, 'diffview')
if (has_diffview) then
  local actions = require("diffview.actions")
  diffview.setup {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true,
        winbar_info = true,
      }
    },
    keymaps = {
      disable_defaults = false, -- Disable the default keymaps
      view = {
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        { "n", "<tab>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        { "n", "gf", actions.goto_file, { desc = "Open the file in a new split in the previous tabpage" } },
        { "n", "<C-w><C-f>", actions.goto_file_split, { desc = "Open the file in a new split" } },
        { "n", "<C-w>gf", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
        { "n", "<leader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel." } },
        { "n", "g<C-x>", actions.cycle_layout, { desc = "Cycle through available layouts." } },
        { "n", "[x", actions.prev_conflict, { desc = "In the merge-tool: jump to the previous conflict" } },
        { "n", "]x", actions.next_conflict, { desc = "In the merge-tool: jump to the next conflict" } },
        { "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Choose the OURS version of a conflict" } },
        { "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Choose the THEIRS version of a conflict" } },
        { "n", "<leader>cb", actions.conflict_choose("base"), { desc = "Choose the BASE version of a conflict" } },
        { "n", "<leader>ca", actions.conflict_choose("all"), { desc = "Choose all the versions of a conflict" } },
        { "n", "dx", actions.conflict_choose("none"), { desc = "Delete the conflict region" } },
      },
      diff1 = {
        -- Mappings in single window diff layouts
        { "n", "g?", actions.help({ "view", "diff1" }), { desc = "Open the help panel" } },
      },
      diff2 = {
        -- Mappings in 2-way diff layouts
        { "n", "g?", actions.help({ "view", "diff2" }), { desc = "Open the help panel" } },
      },
      diff3 = {
        -- Mappings in 3-way diff layouts
        { { "n", "x" }, "2do", actions.diffget("ours"),
          { desc = "Obtain the diff hunk from the OURS version of the file" } },
        { { "n", "x" }, "3do", actions.diffget("theirs"),
          { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
        { "n", "g?", actions.help({ "view", "diff3" }), { desc = "Open the help panel" } },
      },
      diff4 = {
        -- Mappings in 4-way diff layouts
        { { "n", "x" }, "1do", actions.diffget("base"),
          { desc = "Obtain the diff hunk from the BASE version of the file" } },
        { { "n", "x" }, "2do", actions.diffget("ours"),
          { desc = "Obtain the diff hunk from the OURS version of the file" } },
        { { "n", "x" }, "3do", actions.diffget("theirs"),
          { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
        { "n", "g?", actions.help({ "view", "diff4" }), { desc = "Open the help panel" } },
      },
      file_panel = {
        { "n", "j", actions.next_entry, { desc = "Bring the cursor to the next file entry" } },
        { "n", "<down>", actions.next_entry, { desc = "Bring the cursor to the next file entry" } },
        { "n", "k", actions.prev_entry, { desc = "Bring the cursor to the previous file entry." } },
        { "n", "<up>", actions.prev_entry, { desc = "Bring the cursor to the previous file entry." } },
        { "n", "<cr>", actions.select_entry, { desc = "Open the diff for the selected entry." } },
        { "n", "o", actions.select_entry, { desc = "Open the diff for the selected entry." } },
        { "n", "<2-LeftMouse>", actions.select_entry, { desc = "Open the diff for the selected entry." } },
        { "n", "-", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry." } },
        { "n", "S", actions.stage_all, { desc = "Stage all entries." } },
        { "n", "U", actions.unstage_all, { desc = "Unstage all entries." } },
        { "n", "X", actions.restore_entry, { desc = "Restore entry to the state on the left side." } },
        { "n", "L", actions.open_commit_log, { desc = "Open the commit log panel." } },
        { "n", "<c-b>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
        { "n", "<c-f>", actions.scroll_view(0.25), { desc = "Scroll the view down" } },
        { "n", "<tab>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        { "n", "gf", actions.goto_file, { desc = "Open the file in a new split in the previous tabpage" } },
        { "n", "<C-w><C-f>", actions.goto_file_split, { desc = "Open the file in a new split" } },
        { "n", "<C-w>gf", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
        { "n", "i", actions.listing_style, { desc = "Toggle between 'list' and 'tree' views" } },
        { "n", "f", actions.toggle_flatten_dirs, { desc = "Flatten empty subdirectories in tree listing style." } },
        { "n", "R", actions.refresh_files, { desc = "Update stats and entries in the file list." } },
        { "n", "<leader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel" } },
        { "n", "g<C-x>", actions.cycle_layout, { desc = "Cycle available layouts" } },
        { "n", "[x", actions.prev_conflict, { desc = "Go to the previous conflict" } },
        { "n", "]x", actions.next_conflict, { desc = "Go to the next conflict" } },
        { "n", "g?", actions.help("file_panel"), { desc = "Open the help panel" } },
      },
      file_history_panel = {
        { "n", "g!", actions.options, { desc = "Open the option panel" } },
        { "n", "<C-A-d>", actions.open_in_diffview, { desc = "Open the entry under the cursor in a diffview" } },
        { "n", "y", actions.copy_hash, { desc = "Copy the commit hash of the entry under the cursor" } },
        { "n", "L", actions.open_commit_log, { desc = "Show commit details" } },
        { "n", "zR", actions.open_all_folds, { desc = "Expand all folds" } },
        { "n", "zM", actions.close_all_folds, { desc = "Collapse all folds" } },
        { "n", "j", actions.next_entry, { desc = "Bring the cursor to the next file entry" } },
        { "n", "<down>", actions.next_entry, { desc = "Bring the cursor to the next file entry" } },
        { "n", "k", actions.prev_entry, { desc = "Bring the cursor to the previous file entry." } },
        { "n", "<up>", actions.prev_entry, { desc = "Bring the cursor to the previous file entry." } },
        { "n", "<cr>", actions.select_entry, { desc = "Open the diff for the selected entry." } },
        { "n", "o", actions.select_entry, { desc = "Open the diff for the selected entry." } },
        { "n", "<2-LeftMouse>", actions.select_entry, { desc = "Open the diff for the selected entry." } },
        { "n", "<c-b>", actions.scroll_view(-0.25), { desc = "Scroll the view up" } },
        { "n", "<c-f>", actions.scroll_view(0.25), { desc = "Scroll the view down" } },
        { "n", "<tab>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        { "n", "gf", actions.goto_file, { desc = "Open the file in a new split in the previous tabpage" } },
        { "n", "<C-w><C-f>", actions.goto_file_split, { desc = "Open the file in a new split" } },
        { "n", "<C-w>gf", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
        { "n", "<leader>e", actions.focus_files, { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b", actions.toggle_files, { desc = "Toggle the file panel" } },
        { "n", "g<C-x>", actions.cycle_layout, { desc = "Cycle available layouts" } },
        { "n", "g?", actions.help("file_history_panel"), { desc = "Open the help panel" } },
      },
      option_panel = {
        { "n", "<tab>", actions.select_entry, { desc = "Change the current option" } },
        { "n", "q", actions.close, { desc = "Close the panel" } },
        { "n", "g?", actions.help("option_panel"), { desc = "Open the help panel" } },
      },
      help_panel = {
        { "n", "q", actions.close, { desc = "Close help menu" } },
        { "n", "<esc>", actions.close, { desc = "Close help menu" } },
      },
    },
  }

  vim.keymap.set("n", "<leader>gvo", ":DiffviewOpen<CR>")
  vim.keymap.set("n", "<leader>gvc", ":DiffviewClose<CR>")
  vim.keymap.set("n", "<leader>gvr", ":DiffviewRefresh<CR>")
  vim.keymap.set("n", "<leader>gvh", ":DiffviewFileHistory %<CR>")
end

-- Git
vim.keymap.set("n", "<leader>gs", ":Git<CR>")
vim.keymap.set("v", "<leader>b",
  ":<C-U>!git blame <C-R>=expand(\"%:p\") <CR> | sed -n <C-R>=line(\"'<\") <CR>,<C-R>=line(\"'>\") <CR>p <CR>")
