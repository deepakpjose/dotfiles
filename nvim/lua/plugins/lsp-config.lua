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
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "clangd"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                copilot = {
                     -- stylua: ignore
                    keys = {
                      {
                        "<M-]>",
                        function() vim.lsp.inline_completion.select({ count = 1 }) end,
                        desc = "Next Copilot Suggestion",
                        mode = { "i", "n" },
                      },
                      {
                        "<M-[>",
                        function() vim.lsp.inline_completion.select({ count = -1 }) end,
                        desc = "Prev Copilot Suggestion",
                        mode = { "i", "n" },
                      },
                    },
                },
            }
        },
        config = function()
            vim.lsp.enable('clangd')
            vim.lsp.config('clangd', {})

        end
    }
}
