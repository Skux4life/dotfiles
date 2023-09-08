return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        auto_install = false,
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging using the nvim-ts-autotage plugin
        autotag = { enable = true },
        autopairs = { enable = true },
        -- ensure the following language parsers are installed
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "yaml",
          "html",
          "markdown",
          "go",
          "lua",
          "vim",
          "python",
        },
      })
    end,
  },
}
