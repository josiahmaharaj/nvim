return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      debug = true,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.pint,
        null_ls.builtins.diagnostics.phpstan,
        -- null_ls.builtins.diagnostics."markdownlint-cli2",
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>gf", vim.lsp.buf.format, {})
  end
}
