return {{
    "pmizio/typescript-tools.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
    opts = {
        settings = {
            separate_diagnostic_server = true,
            publish_diagnostic_on = "insert_leave",
            tsserver_path = nil,
            tsserver_max_memory = "auto",
            tsserver_format_options = {
                indentSize = 2,
                convertTabsToSpaces = true
            },
            complete_function_calls = true,
            include_completions_with_insert_text = true,
            code_lens = "all",
            disable_member_code_lens = true,
            tsserver_file_preferences = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true
                }
            },
            jsx_close_tag = {
                enable = true,
                filetypes = {"javascriptreact", "typescriptreact"}
            },
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                vim.cmd("au! TypescriptToolsCodeLensGroup")
            end,
            capabilities = capabilities
        }
    },
    config = function(_, opts)
        require("typescript-tools").setup(opts)
    end
}}
