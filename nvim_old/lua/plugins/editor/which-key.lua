---@module "lazy"
---@type LazySpec
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {{
        "<leader>?",
        function()
            require("which-key").show({
                global = false
            })
        end,
        desc = "Buffer Local Keymaps (which-key)"
    },
    {
        '<leader>e',
        function()
            require("neo-tree.command").execute({
                toggle = true,
                dir = vim.loop.cwd()
            })
        end,
        desc = "Toggle NeoTree"
    },
    {
        '<leader>w',
        "<CMD>update<CR>",
        desc = "Save"
    },
    {
        '<leader>v',
        "<CMD>vsplit<CR>",
        desc = "Vertical Split"
    },
    {
        '<leader>h',
        "<CMD>split<CR>",
        desc = "Horizontal Split"
    }
    
},
}
