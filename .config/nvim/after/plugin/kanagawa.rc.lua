local status, kanagawa = pcall(require, 'kanagawa')
if (not status) then return end

kanagawa.setup {
  dimInactive = true,
  globalStatus = true,
}
