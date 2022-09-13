local status, tundra = pcall(require, 'nvim-tundra')
if (not status) then return end

tundra.setup {
  syntax = {
    booleans = { bold = true, italic = true },
    comments = { bold = true, italic = true },
    conditionals = {},
    constants = { bold = true },
    functions = {},
    keywords = { italic = true },
    loops = {},
    numbers = { bold = true },
    operators = { bold = true },
    punctuation = {},
    strings = {},
    types = { italic = true },
  },
}
