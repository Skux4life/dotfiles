local transparent_groups = {
	"Normal",
	"NormalNC",
	"EndOfBuffer",
	"SignColumn",
	"LineNr",
	"FoldColumn",
	"NormalFloat",
	"Pmenu",
}

local function transparent_on()
	for _, g in ipairs(transparent_groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none", ctermbg = "none" })
	end
	vim.g.transparent_enabled = true
end

local function transparent_off()
	if vim.g.colors_name then
		vim.cmd("colorscheme " .. vim.g.colors_name)
		vim.g.transparent_enabled = false
	end
end

vim.api.nvim_create_user_autocmd("TransparentOn", transparent_on, {})
vim.api.nvim_create_user_autocmd("TransparentOff", transparent_off, {})
vim.api.nvim_create_user_autocmd("TransparentToggle", function()
	if vim.g.transparent_enabled then
		transparent_off()
	else
		transparent_on()
	end
end, {})
