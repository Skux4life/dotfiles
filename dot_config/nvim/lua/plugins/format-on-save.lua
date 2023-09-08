return {
	'elentok/format-on-save.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local format_on_save = require('format-on-save')
		local formatters = require('format-on-save.formatters')

		format_on_save.setup({
			exclude_path_patterns = {
				'/node_modules/',
				'.local/share/nvim/lazy',
			},
			formatter_by_ft = {
				go = formatters.lsp,
				javascript = {
					formatters.if_file_exists({
						pattern = ".eslintrc.*",
						formatter = formatters.eslint_d_fix,
					}),
					formatters.if_file_exists({
						pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
						formatter = formatters.prettierd,
					}),
				},
				typescript = {
					formatters.if_file_exists({
						pattern = ".eslintrc.*",
						formatter = formatters.eslint_d_fix,
					}),
					formatters.if_file_exists({
						pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
						formatter = formatters.prettierd,
					}),
				},
			},

		})
	end
}
