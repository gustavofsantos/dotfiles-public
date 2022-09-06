local status, poimandres = pcall(require, 'poimandres')
if (not status) then return end

poimandres.setup {
  bold_vert_split = true,
  dim_nc_background = true
}
