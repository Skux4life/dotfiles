return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', event = { "BufReadPre", "BufNewFile" }, opts = {} },
  {
    'tpope/vim-surround',
    event = { 'BufReadPre', 'BufNewFile' }
  },
  'lukas-reineke/indent-blankline.nvim',
}
