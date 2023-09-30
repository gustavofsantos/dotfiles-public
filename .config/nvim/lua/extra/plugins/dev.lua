return {
    "folke/neodev.nvim",
    config = function()
        require('neodev').setup({
            library = { plugins = { "neotest" }, types = true },
        })
    end
}
