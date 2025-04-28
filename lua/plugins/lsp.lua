-- LSP configuration & Plugins
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Configure LuaLS for editing Neovim config
      {
        {
          'folke/lazydev.nvim',
          ft = 'lua', -- only load on lua files
          opts = {
            library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
          },
        },
        { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings
        { -- optional completion source for require statements and module annotations
          'hrsh7th/nvim-cmp',
          opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
              name = 'lazydev',
              group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
          end,
        },
      },

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- Mason
      require('mason').setup {
        ui = {
          border = 'rounded',
          height = 0.7,
        },
      }

      -- borders for LSPInfo
      require('lspconfig.ui.windows').default_options.border = 'rounded'

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          map('<leader>ld', require('telescope.builtin').lsp_definitions, '[L]SP: go to [D]efinition')

          -- Find references for the word under your cursor.
          map('<leader>lr', require('telescope.builtin').lsp_references, '[L]SP: go to [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('<leader>li', require('telescope.builtin').lsp_implementations, '[L]SP: go to [I]mplementations')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>lt', require('telescope.builtin').lsp_type_definitions, '[L]SP: [T]ype Definition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>lsd', require('telescope.builtin').lsp_document_symbols, '[L]SP: [D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>lsw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[L]SP: [W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>ln', vim.lsp.buf.rename, '[L]SP: Re[N]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- for a suggestion from your LSP for this to activate.
          map('<leader>la', vim.lsp.buf.code_action, '[L]SP: Code [A]ction')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('<leader>lD', vim.lsp.buf.declaration, '[L]SP: go to [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          -- Toggle inlay hints
          ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Ensure lintr for R
      vim.g.LanguageClient_serverCommands = {
        r = { 'R', '--slave', '-e', 'languageserver::run()' },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      local servers = {
        -- Lua language server
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        -- Bash language server
        bashls = {},
        -- VSCode CSS language server
        cssls = {},
        -- VSCode HTML language server
        html = {},
        -- Json language server
        jsonls = {},
        -- Grammar language server
        ltex = {
          settings = {
            ltex = {
              language = 'en-GB', -- Check against British English
            },
          },
        },
        -- Perl language server
        perlnavigator = {},
        -- Python language server
        pyright = {},
        -- R language server
        r_language_server = {
          filetypes = { 'r', 'rmd', 'quarto' },
        },
        -- Typst language server
        tinymist = {},
        -- YAML language server
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
                url = '',
              },
            },
          },
        },
        -- TOML language server
        taplo = {},
      }

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
