--- Completion plugin
return {{
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {'rafamadriz/friendly-snippets', "onsails/lspkind.nvim", {"xzbdmw/colorful-menu.nvim",
    config = function()
        require("colorful-menu").setup({
            ls = {
                ts_ls = {

                },

            }
        })
    end
},"fang2hou/blink-copilot"},
    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            -- preset = 'default',
            ["<C-space>"] = {"show", "show_documentation", "hide_documentation"},
            ["<C-e>"] = {"hide", "fallback"},
            ["<CR>"] = {"accept", "fallback"},

            ["<Tab>"] = {function(cmp)
                return cmp.select_next()
            end, "snippet_forward", "fallback"},
            ["<S-Tab>"] = {function(cmp)
                return cmp.select_prev()
            end, "snippet_backward", "fallback"},

            ["<Up>"] = {"select_prev", "fallback"},
            ["<Down>"] = {"select_next", "fallback"},
            ["<C-p>"] = {"select_prev", "fallback"},
            ["<C-n>"] = {"select_next", "fallback"},
            ["<C-up>"] = {"scroll_documentation_up", "fallback"},
            ["<C-down>"] = {"scroll_documentation_down", "fallback"}
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
                update_delay_ms = 50,
                window = {
                    max_width = math.min(100, vim.o.columns),
                    -- border = "rounded",
                },

            },
            -- list = {
            --     selection = function(ctx)
            --         return ctx.mode == "cmdline" and "auto_insert" or "preselect"
            --     end,
            -- },
            menu = {
                -- border = "rounded",
                -- cmdline_position = function()
                --     if vim.g.ui_cmdline_pos ~= nil then
                --         local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                --         return {pos[1] - 1, pos[2]}
                --     end
                --     local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                --     return {vim.o.lines - height, 0}
                -- end,
                min_width = 15,
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                draw = {
                    columns = {{
                        "kind_icon",
                        "label",
                        gap = 1
                    }, {"kind"}},
                    components = {
                        -- kind_icon = {
                        --     text = function(item)
                        --         local lspkind = require("lspkind")
                        --         local kind = lspkind.symbol_map[item.kind] or ""
                        --         return kind .. " "
                        --     end,
                        --     highlight = "CmpItemKind"
                        -- },
                        -- label = {
                        --     text = function(item)
                        --         return item.label
                        --     end,
                        --     highlight = "CmpItemAbbr"
                        -- },
                        -- kind = {
                        --     text = function(item)
                        --         return item.kind
                        --     end,
                        --     highlight = "CmpItemKind"
                        -- }
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                        source = {
                            text = function(ctx)
                                local map = {
                                    ["lsp"] = "[]",
                                    ["path"] = "[󰉋]",
                                    ["snippets"] = "[]",
                                }
    
                                return map[ctx.item.source_id]
                            end,
                            highlight = "BlinkCmpDoc",
                        },
                    }
                }
            }
        },

        signature = {
            enabled = true,
            window = {
                border = "rounded"
            }
        },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = {"lsp","copilot" ,"path", "snippets", "buffer",},
            -- cmdline = {}, -- Disable sources for command-line mode
            providers = {
                lsp = {
                    min_keyword_length = 2, -- Number of characters to trigger porvider
                    score_offset = 0 -- Boost/penalize the score of the items
                },
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Copilot"
                        for _, item in ipairs(items) do
                          item.kind = kind_idx
                        end
                        return items
                      end,
                  },
                path = {
                    min_keyword_length = 0
                },
                snippets = {
                    min_keyword_length = 2
                },
                buffer = {
                    min_keyword_length = 5,
                    max_items = 5
                }
            }
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = {
            implementation = "prefer_rust_with_warning"
        }
    },
    opts_extend = {"sources.default"}
}}
