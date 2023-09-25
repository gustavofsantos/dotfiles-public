local has_neotest, _ = pcall(require, "neotest")
if has_neotest and false then
    require("neotest").setup({
        adapters = {
            require("neotest-vim-test")({
                allow_file_types = { "javascript", "javascriptreact" }
            }),
        },
        icons = {
            running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        },
    })
end
