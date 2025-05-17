return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },

    config = function ()
        require("mason").setup()
        require("mason-lspconfig").setup {
            automatic_enable = false,
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "pylsp",
            },

            handlers = {
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end
            }
        }

        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require('lspconfig')

        lspconfig['lua_ls'].setup({ capabilities = capabilities })
        lspconfig['pylsp'].setup({ capabilities = capabilities })
        lspconfig['clangd'].setup({ capabilities = capabilities })
        lspconfig['rust_analyzer'].setup({ capabilities = capabilities })

        vim.diagnostic.config({
            update_in_insert = true,
        })

    end
}
