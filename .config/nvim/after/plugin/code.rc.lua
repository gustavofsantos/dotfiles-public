vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


local has_autopairs, autopairs = pcall(require, "nvim-autopairs")
if (has_autopairs) then
  autopairs.setup {}
end

local has_comment, comment = pcall(require, 'Comment')
if (has_comment) then
  comment.setup {}
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local has_cmp, cmp = pcall(require, 'cmp')
local has_lspkind, lspkind = pcall(require, 'lspkind')
local has_luasnip, luasnip = pcall(require, 'luasnip')
if (has_cmp and has_lspkind and has_luasnip) then
  cmp.setup({
    performance = {
      debounce = 300,
    },
    completion = {
      -- autocomplete = true
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
    }),
    sources = cmp.config.sources({
      { name = 'luasnip' },
      { name = 'nvim_lua ' },
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' }
    }),
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        mode = 'symbol', -- show only symbol annotations
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        maxwidth = 70,
        menu = {
          luasnip = "[snip]",
          buffer = "[buf]",
          nvim_lsp = "[lsp]",
          nvim_lua = "[api]",
          path = "[path]",
        }
      })
    }
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      { name = 'luasnip' }
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

local has_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
if has_treesitter then
  treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
      "gitcommit",
      "git_rebase",
      "go",
      "help",
      "lua",
      "json",
      "proto",
      "toml",
      "http",
      "norg",
      "org",
      "rust",
      "javascript",
      "jsdoc",
      "typescript",
      "tsx",
      "prisma",
      "python",
      "vim",
      "elixir",
      "css",
      "eex",
      "heex",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false
    },
    indent = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<c-backspace>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
    context_commentstring = {
      enable = true
    }
  }

  require('nvim-treesitter.configs').setup {
    autotag = {
      enable = true
    },
    textsubjects = {
      enable = true,
      prev_selection = ',', -- (Optional) keymap to select the previous selection
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    },
  }

  local has_ufo, ufo = pcall(require, 'ufo')
  if has_ufo then
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, {chunkText, hlGroup})
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, {suffix, 'MoreMsg'})
      return newVirtText
    end

    ufo.setup({
      open_fold_hl_timeout = 500,
      close_fold_kinds = {'imports', 'comment'},
      fold_virt_text_handler = handler,
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })


    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end

  local has_headlines, headlines = pcall(require, 'headlines')
  if has_headlines then
    headlines.setup()
  end
end

local has_null_ls, null_ls = pcall(require, "null-ls")
if has_null_ls then
  null_ls.setup {
    debounce = 300,
    sources = {
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.diagnostics.fish,
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.formatting.prettier
    }
  }
end

if (has_luasnip) then
  require("luasnip.loaders.from_vscode").lazy_load {
    paths = { "~/.config/nvim/snippets" }
  }
end
