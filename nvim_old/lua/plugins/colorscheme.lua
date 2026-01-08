return {{
    "folke/tokyonight.nvim",
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent"
        }
    }
}, {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        transparent_background = true,
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15 -- percentage of the shade to apply to the inactive window
        },
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = {"italic"}, -- Change the style of comments
            conditionals = {"italic"},
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = ""
                }
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            }
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
        }
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)

        -- set color schema
        vim.cmd.colorscheme "catppuccin"
    end
}, {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    otps = function()
        return {
            transparent = true
        }
    end
}}
