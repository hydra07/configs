return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        term_colors = true,
        integrations = {
          blink_cmp = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
            },
          },
          treesitter = true,
          which_key = true,
        },
		compile = { enabled = true },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
{
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local function get_formatter()
        local ok, conform = pcall(require, "conform")
        if not ok then return "" end 
        local formatters = conform.list_formatters(0)
        if #formatters == 0 then return "" end
        return formatters[1].name
      end
      local function get_lsp_client()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients == 0 then return "" end
        local formatter_name = get_formatter()
        local client_names = {}
        for _, client in ipairs(clients) do
          if client.name ~= formatter_name and client.name ~= "copilot" then
            table.insert(client_names, client.name)
          end
        end
        if #client_names == 0 then return "" end
        return " " .. table.concat(client_names, ", ")
      end
      local function inlay_status()
        local ok, _ = pcall(require, "lspconfig") 
        if not ok then return "" end
        if vim.lsp.inlay_hint and vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }) then 
          return "󰄲 Hints" 
        end
        return ""
      end

      return {
        options = {
          theme = "catppuccin",
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          refresh = { statusline = 2000 }, 
          disabled_filetypes = { statusline = { "dashboard", "alpha", "neo-tree" } },
        },
        sections = {
          lualine_a = { { "mode", right_padding = 2 } },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { 
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } }, 
            { "filename", path = 1 } 
          },
          lualine_x = {
            { inlay_status, color = { fg = "#fab387" } },
            { 
              function() 
                local f = get_formatter()
                return f ~= "" and ("󰉼 " .. f) or "" 
              end, 
              color = { fg = "#a6e3a1" },
              cond = function() return get_formatter() ~= "" end 
            },
            { 
              get_lsp_client, 
              color = { fg = "#89b4fa", gui = "bold" },
              cond = function() return #vim.lsp.get_clients({ bufnr = 0 }) > 0 end 
            },
            { "encoding" },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "neo-tree", "lazy", "mason" },
      }
    end,
  },
}