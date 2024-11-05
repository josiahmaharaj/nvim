return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "vim",
        "vimdoc",
        "tsx",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "vue",
        "rust",
        "python",
        "php",
        "phpdoc",
      },
    })
  end
}
