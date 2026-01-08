return {{
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {
        cmd = "Mason",
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },
            check_outdated_packages_on_open = true,
            border = "rounded",
            width = 0.9,
            height = 0.9
        }
    }
}, {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {'neovim/nvim-lspconfig'},
    opts = {},
}, {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {"mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim"},
    cmd = {"MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean"},
    opts = {
        auto_update = true,
        ensure_installed = {"bashls", "eslint_d", "harper_ls", "html", "jsonlint", "jsonls", "lemminx", "lua_ls",
                            "markdownlint", "marksman", "prettier", "pyright", "ruff", "shellcheck", "shfmt", "stylua",
                            "taplo", "ts_ls", "xmlformatter", "yamlfmt", "yamllint", "yamlls"}
    }
}}
