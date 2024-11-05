return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")

      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap

      local opts = { noremap = true, silent = true }

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        opts. desc = "See availalbe code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set({"n", "v"}, "<leader>gd", vim.lsp.buf.definition, opts)
        keymap.set({"n", "v"}, "<leader>gr", vim.lsp.buf.references, opts)
        keymap.set({"n", "v"}, "K", vim.lsp.buf.hover, opts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "html", "css", "javascript", "typescript", "vue" },
        cmd = { "npx", "tailwindcss-language-server", "--stdio" },
        on_attach = on_attach,
      })

      lspconfig.phpactor.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.intelephense.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })



      lspconfig.lua_ls.setup({
        on_attach = on_attach,
      })

    end
  }
}
