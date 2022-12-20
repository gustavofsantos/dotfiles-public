local has_poimandres, poimandres = pcall(require, 'poimandres')
if has_poimandres then
  poimandres.setup {
    bold_vert_split = true,
    dim_nc_background = true
  }
end

local has_kanagawa, kanagawa = pcall(require, 'kanagawa')
if has_kanagawa then
  kanagawa.setup {
    dimInactive = true,
    globalStatus = true,
  }
end
