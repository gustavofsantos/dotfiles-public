local has_mini_move, mini_move = pcall(require, "mini.move")
if has_mini_move then
    mini_move.setup()
end

local has_mini_splitjoin, mini_splitjoin = pcall(require, "mini.splitjoin")
if has_mini_splitjoin then
    mini_splitjoin.setup()
end

local has_mini_hipatterns, mini_hipatterns = pcall(require, "mini.hipatterns")
if has_mini_hipatterns then
    local hipatterns = require('mini.hipatterns')
    mini_hipatterns.setup({
        highlighters = {
            -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })
end

local has_mini_bracketed, mini_bracketed = pcall(require, "mini.bracketed")
if has_mini_bracketed then
    mini_bracketed.setup()
end
