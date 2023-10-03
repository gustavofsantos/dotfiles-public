return {
    { "echasnovski/mini.completion", event = "VeryLazy", enabled = false, opts = {} },
    { "echasnovski/mini.move", lazy = false, opts = {} },
    { "echasnovski/mini.splitjoin", lazy = false, opts = {} },
    { "echasnovski/mini.bracketed", event = "VeryLazy", opts = {} },
    {
        "echasnovski/mini.hipatterns",
        event = "VeryLazy",
        config = function()
            local hipatterns = require("mini.hipatterns")
            hipatterns.setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end,
    },
}
