local status, conflict = pcall(require, 'git-conflict')
if (not status) then return end

conflict.setup {}
--[[
  Mappings
    co - choose ours
    ct - choose theirs
    cb - choose both
    c0 - choose none
    ]x - move to previous conflict
    [x - move to next conflict
--]]
