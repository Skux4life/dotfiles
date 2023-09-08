return {
	{
		'folke/neodev.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			local neodev_status_ok, neodev = pcall(require, 'neodev')

			if not neodev_status_ok then
				return
			end

			neodev.setup()
		end
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		},
		config = function()
			local lsp = require('lsp-zero').preset({ 'recommended' })
			lsp.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp.default_keymaps({ buffer = bufnr })
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			end)

			-- (Optional) Configure lua language server for neovim
			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

			lsp.ensure_installed({
				'pyright',
				'gopls',
				'lua_ls',
				'tsserver',
				'eslint',
			})

			lsp.setup()
			require('luasnip.loaders.from_vscode').lazy_load()
			local cmp = require('cmp')
			local cmp_select = { behaviour = cmp.SelectBehavior.Select }
			local cmp_mappings = lsp.defaults.cmp_mappings({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
			})

			cmp_mappings['<Tab>'] = nil
			cmp_mappings['<S-Tab>'] = nil

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' }, -- lsp
					{ name = 'luasnip' }, -- snippets
					{ name = 'buffer' }, -- text within current buffer
					{ name = 'path' }, -- file system paths
				}),
				mapping = cmp_mappings,
			})
		end
	},
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'rafamadriz/friendly-snippets' },
}
