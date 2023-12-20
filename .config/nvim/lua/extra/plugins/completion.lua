---@diagnostic disable: missing-fields
return {
  { "hrsh7th/vim-vsnip" },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "onsails/lspkind.nvim",
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        preselect = "None",
        performance = {
          debounce = 500,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            symbol_map = { Copilot = "" },
          }),
        },
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      require("copilot_cmp").setup()
    end,
  },
}
