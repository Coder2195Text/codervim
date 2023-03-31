--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
-- A split up user configuration example can be found at: https://github.com/AstroNvim/split_user_example
-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
    icons = { VimIcon = "", ScrollText = "" },
    -- Configure AstroNvim updates
    updater = {
        remote = "origin",     -- remote to use
        channel = "nightly",   -- "stable" or "nightly"
        version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main",       -- branch name (NIGHTLY ONLY)
        commit = nil,          -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false,  -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false      -- automatically quit the current session after a successful update
        -- remotes = { -- easily add new remotes to track
        --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        -- },
    },
    -- Set colorscheme to use
    colorscheme = "everforest",
    -- Add highlight groups in any theme
    highlights = {
        -- init = { -- this table overrides highlights in all themes
        --   Normal = { bg = "#000000" },
        -- }
        -- duskfox = { -- a table of overrides/changes to the duskfox theme
        --   Normal = { bg = "#000000" },
        -- },
    },
    -- set vim options here (vim.<first_key>.<second_key> = value)
    options = {
        opt = {
            -- set to true or false etc.
            relativenumber = true, -- sets vim.opt.relativenumber
            number = true,         -- sets vim.opt.number
            spell = false,         -- sets vim.opt.spell
            signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
            wrap = false           -- sets vim.opt.wrap
        },
        g = {
            mapleader = " ",                   -- sets vim.g.mapleader
            autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
            cmp_enabled = true,                -- enable completion at start
            autopairs_enabled = true,          -- enable autopairs at start
            diagnostics_enabled = true,        -- enable diagnostics at start
            status_diagnostics_enabled = true, -- enable diagnostics in statusline
            icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
            ui_notifications_enabled = true    -- disable notifications when toggling UI elements
        }
    },
    -- If you need more control, you can use the function()...end notation
    -- options = function(local_vim)
    --   local_vim.opt.relativenumber = true
    --   local_vim.g.mapleader = " "
    --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
    --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
    --
    --   return local_vim
    -- end,

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = { virtual_text = true, underline = true },
    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true,     -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                }
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "lua_ls",
            },
            timeout_ms = 5000 -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- easily add or disable built in mappings added during LSP attaching
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
            }
        },
        -- add to the global LSP on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the LSP setup handler function based on server name
        -- setup_handlers = {
        --   -- first function changes the default setup handler
        --   function(server, opts) require("lspconfig")[server].setup(opts) end,
        --   -- keys for a specific server name will be used for that LSP
        --   lua_ls = function(server, opts)
        --     -- custom lua_ls setup handler
        --     require("lspconfig")["lua_ls"].setup(opts)
        --   end,
        -- },

        -- Add overrides for LSP server settings, the keys are the name of the server
        config = {
            -- example for addings schemas to yamlls
            -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
            --   settings = {
            --     yaml = {
            --       schemas = {
            --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --       },
            --     },
            --   },
            -- },
        }
    },
    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
        -- first key is the mode,
        i = {
                ["<F7>"] = { "<Esc><cmd>ToggleTerm size=10 direction=horizontal<cr>" },
                ["<F8>"] = {
                "<Esc><cmd>:AerialToggle<cr>",
                desc = "Toggle Symbols Outline"
            },
                ["<S-Tab>"] = { "<Esc><cmd>bnext<cr>", desc = "Next Buffer" },
                ["<C-a>"] = { "<Esc>ggVGi", desc = "Select All" },
                ["<C-s>"] = { "<Esc><cmd>w!<cr>", desc = "Force write" }
        },
        n = {
                ["<F7>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>" },
                ["<F8>"] = {
                "<cmd>:AerialToggle<cr>",
                desc = "Toggle Symbols Outline"
            },
            -- open config file
                ["<leader>v"] = { name = "CoderVim" },
                ["<leader>vc"] = {
                "<cmd>:e /home/coder2195/.config/nvim/lua/user/init.lua<cr>",
                desc = "Open CoderVim Config"
            },
                ["<leader>s"] = {
                "<cmd>:AerialToggle<cr>",
                desc = "Toggle Symbols Outline"
            },
                ["<S-Tab>"] = { "<Esc><cmd>bnext<cr>", desc = "Next Buffer" },
                ["<C-a>"] = { "ggVG", desc = "Select All" },
            -- second key is the lefthand side of the map
            -- mappings seen under group name "Buffer"
                ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                ["<leader>bc"] = {
                "<cmd>BufferLinePickClose<cr>",
                desc = "Pick to close"
            },
                ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                ["<leader>bt"] = {
                "<cmd>BufferLineSortByTabs<cr>",
                desc = "Sort by tabs"
            },
            -- tables with the `name` key will be registered with which-key if it's installed
            -- this is useful for naming menus
                ["<leader>b"] = { name = "Buffers" },
                ["<leader>T"] = { name = "Telescope" },
                ["<leader>Tc"] = {
                "<cmd>Telescope colorscheme<cr>",
                desc = "Set colorscheme"
            },
                ["<leader>Tp"] = {
                "<cmd>Telescope projects<cr>",
                desc = "Open project"
            },
                ["<leader>vu"] = { "<cmd>:Lazy update<cr>", desc = "Update plugins" }
            -- quick save
            -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
            -- setting a mapping to false will disable it
                ["<Esc>"] = { "<C-\\><C-n>", desc = "Terminal Escape" }
        }
    },
    -- Configure require("lazy").setup() options
    lazy = {
        defaults = { lazy = true },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = {
                    "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin",
                    "tarPlugin", "matchparen"
                }
            }
        }
    },
    -- Configure plugins
    plugins = {
        -- You can disable default plugins as follows:
        -- { "max397574/better-escape.nvim", enabled = false },
        --
        -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
        -- {
        --   "L3MON4D3/LuaSnip",
        --   config = function(plugin, opts)
        --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
        --     -- add more custom luasnip configuration such as filetype extend or custom snippets
        --     local luasnip = require "luasnip"
        --     luasnip.filetype_extend("javascript", { "javascriptreact" })
        --   end,
        -- },
        -- {
        --   "windwp/nvim-autopairs",
        --   config = function(plugin, opts)
        --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
        --     -- add more custom autopairs configuration such as custom rules
        --     local npairs = require "nvim-autopairs"
        --     local Rule = require "nvim-autopairs.rule"
        --     local cond = require "nvim-autopairs.conds"
        --     npairs.add_rules(
        --       {
        --         Rule("$", "$", { "tex", "latex" })
        --           -- don't add a pair if the next character is %
        --           :with_pair(cond.not_after_regex "%%")
        --           -- don't add a pair if  the previous character is xxx
        --           :with_pair(
        --             cond.not_before_regex("xxx", 3)
        --           )
        --           -- don't move right when repeat character
        --           :with_move(cond.none())
        --           -- don't delete if the next character is xx
        --           :with_del(cond.not_after_regex "xx")
        --           -- disable adding a newline when you press <cr>
        --           :with_cr(cond.none()),
        --       },
        --       -- disable for .vim files, but it work for another filetypes
        --       Rule("a", "a", "-vim")
        --     )
        --   end,
        -- },
        -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
        -- {
        --   "folke/which-key.nvim",
        --   config = function(plugin, opts)
        --     require "plugins.configs.which-key"(plugin, opts)
        --     -- Add bindings which show up as group name
        --     local wk = require "which-key"
        --     wk.register({
        --       b = { name = "Buffer" },
        --     }, { mode = "n", prefix = "<leader>" })
        --   end,
        -- },

        -- You can also add new plugins here as well:
        -- Add plugins, the lazy syntax
        -- "andweeb/presence.nvim",
        -- {
        --   "ray-x/lsp_signature.nvim",
        --   event = "BufRead",
        --   config = function()
        --     require("lsp_signature").setup()
        --   end,
        -- },

        -- Plugin entries can also be used to override the default options for plugins as well
        {
            "goolord/alpha-nvim",
            opts = function(_, opts)
                -- customize the dashboard header
                opts.section.header.val = {
                    " ▄████▄   ▒█████  ▓█████▄ ▓█████  ██▀███   ██▒   █▓ ██▓ ███▄ ▄███▓",
                    "▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀ ▓██ ▒ ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
                    "▒▓█    ▄ ▒██░  ██▒░██   █▌▒███   ▓██ ░▄█ ▒ ▓██  █▒░▒██▒▓██    ▓██░",
                    "▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄ ▒██▀▀█▄    ▒██ █░░░██░▒██    ▒██ ",
                    "▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒░██▓ ▒██▒   ▒▀█░  ░██░▒██▒   ░██▒",
                    "░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░   ░ ▐░  ░▓  ░ ▒░   ░  ░ ",
                    "  ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░  ░▒ ░ ▒░   ░ ░░   ▒ ░░  ░      ░",
                    "░        ░ ░ ░ ▒   ░ ░  ░    ░     ░░   ░      ░░   ▒ ░░      ░   ",
                    "░ ░          ░ ░     ░       ░  ░   ░           ░   ░         ░   ",
                    "░                  ░                           ░                  "
                }
                local button = require("astronvim.utils").alpha_button
                -- add a button to update plugins

                opts.section.buttons.val = {
                    button("LDR n", "  New File  "),
                    button("LDR f f", "  Find File  "),
                    button("LDR f o", "  Recents  "),
                    button("LDR T p", "  Projects  "),
                    button("LDR v c", "  Edit Config  "),
                    button("LDR S l", "  Last Session  "),
                    button("LDR v u", "  Update  "),

                    button("LDR q", "  Quit Neovim")
                }

                return opts
            end
        }, {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, config)
            -- config variable is the default configuration table for the setup function call
            -- local null_ls = require "null-ls"

            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            config.sources = {
                -- Set a formatter
                -- null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.prettier,
            }
            return config     -- return final config table
        end
    }, {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            -- ensure_installed = { "lua" },
        }
    },     -- use mason-lspconfig to configure LSP installations
        {
            "williamboman/mason-lspconfig.nvim",
            -- overrides `require("mason-lspconfig").setup(...)`
            opts = {
                -- ensure_installed = { "lua_ls" },
            }
        },
        -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
        {
            "jay-babu/mason-null-ls.nvim",
            -- overrides `require("mason-null-ls").setup(...)`
            opts = {
                -- ensure_installed = { "prettier", "stylua" },
            }
        }, {
        "jay-babu/mason-nvim-dap.nvim",
        -- overrides `require("mason-nvim-dap").setup(...)`
        opts = {
            -- ensure_installed = { "python" },
        }
    }, { "wakatime/vim-wakatime", lazy = false }, {
        "xiyaowong/nvim-transparent",
        opts = {},
        lazy = false,
        config = function()
            require("transparent").setup({
                groups = {     -- table: default groups
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special',
                    'Identifier', 'Statement', 'PreProc', 'Type',
                    'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure',
                    'LineNr', 'NonText', 'SignColumn', 'CursorLineNr',
                    'EndOfBuffer'
                },
                extra_groups = {     -- table/string: additional groups that should be cleared
                    -- In particular, when you set it to 'all', that means all available groups

                    -- example of akinsho/nvim-bufferline.lua
                    "BufferLineTabClose", "BufferlineBufferSelected",
                    "BufferLineFill", "BufferLineBackground",
                    "BufferLineSeparator", "BufferLineIndicatorSelected"
                }     -- table: groups you don't want to clear
            })
        end
    }, {
        "gelguy/wilder.nvim",
        opts = {},
        config = function()
            -- config goes here
            local wilder = require('wilder')
            wilder.setup({ modes = { ':', '/', '?' } })
        end,
        lazy = false
    }, { "roxma/nvim-yarp",       opts = {} },
        { "roxma/vim-hug-neovim-rpc", opts = {} },
        { "andweeb/presence.nvim",    opts = {},   event = "VeryLazy" }, {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    auto_refresh = false,
                    keymap = {
                        accept = "<CR>",
                        jump_prev = "[[",
                        jump_next = "]]",
                        refresh = "gr",
                        open = "<M-CR>"
                    }
                },
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<M-l>",
                        prev = "<M-[>",
                        next = "<M-]>",
                        dismiss = "<C-]>"
                    }
                }
            })
        end
    }, {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,     -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                    hide_dotfiles = false,
                    hide_gitignored = true
                }
            }
        }
    }, { "rcarriga/nvim-notify", opts = { background_colour = "#1f2335" } }, {
        -- override nvim-cmp plugin
        "hrsh7th/nvim-cmp",
        -- override the options table that is used in the `require("cmp").setup()` call
        opts = function(_, opts)
            -- opts parameter is the default options table
            -- the function is lazy loaded so cmp is able to be required
            local cmp = require "cmp"
            -- modify the mapping part of the table
            opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
                if require("copilot.suggestion").is_visible() then
                    require("copilot.suggestion").accept()
                elseif cmp.visible() then
                    cmp.select_next_item({
                        behavior = cmp.SelectBehavior.Insert
                    })
                elseif (not luasnip == nil) and luasnip.expandable() then
                    luasnip.expand()
                elseif (not has_words_before == nil) and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" })

            -- return the new table to be used
            return opts
        end
    }, {
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            local utils = require("astronvim.utils")
            local status = require("astronvim.utils.status")
            opts.statusline = {
                -- statusline
                hl = { fg = "fg", bg = "bg" },
                status.component.mode {
                    -- enable mode text with padding as well as an icon before it
                    mode_text = {
                        icon = {
                            kind = "VimIcon",
                            padding = { right = 1, left = 1 }
                        }
                    },
                    -- surround the component with a separators
                    surround = {
                        -- it's a left element, so use the left separator
                        separator = "left",
                        -- set the color of the surrounding based on the current mode using status.module
                        color = function()
                            return {
                                main = status.hl.mode_bg(),
                                right = status.hl.mode_bg()
                            }
                        end
                    }
                },
                -- we want an empty space here so we can use the component builder to make a new section with just an empty string
                -- add a section for the currently opened file information
                status.component.file_info {
                    -- enable the file_icon and disable the highlighting based on filetype
                    file_icon = { padding = { left = 1 } },
                    filename = { fallback = "Empty" },
                    -- add padding
                    padding = { right = 1 },
                    -- define the section separator
                    surround = { separator = "left", condition = false }
                },
                -- add a component for the current git branch if it exists and use no separator for the sections
                status.component.git_branch {
                    surround = { separator = "none" }
                },
                -- add a component for the current git diff if it exists and use no separator for the sections
                status.component.git_diff {
                    padding = { left = 1 },
                    surround = { separator = "none" }
                },
                -- fill the rest of the statusline
                -- the elements after this will appear in the middle of the statusline
                status.component.fill(),
                -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
                status.component.lsp {
                    lsp_client_names = false,
                    surround = { separator = "none", color = "bg" }
                },
                -- fill the rest of the statusline
                -- the elements after this will appear on the right of the statusline
                status.component.fill(),
                -- add a component for the current diagnostics if it exists and use the right separator for the section
                status.component.diagnostics {
                    surround = { separator = "right" }
                },
                -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
                status.component.lsp {
                    lsp_progress = false,
                    surround = { separator = "right" }
                },
                -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
                -- all of the children of this table will be treated together as a single component
                {
                    -- define a simple component where the provider is just a folder icon
                    status.component.builder {
                        -- utils.get_icon gets the user interface icon for a closed folder with a space after it
                        { provider = utils.get_icon "FolderClosed" },
                        -- add padding after icon
                        padding = { right = 1 },
                        -- set the foreground color to be used for the icon
                        hl = { fg = "bg" },
                        -- use the right separator and define the background color
                        surround = {
                            separator = "right",
                            color = "folder_icon_bg"
                        }
                    },
                    -- add a file information component and only show the current working directory name
                    status.component.file_info {
                        -- we only want filename to be used and we can change the fname
                        -- function to get the current working directory name
                        filename = {
                            fname = function(nr)
                                return vim.fn.getcwd(nr)
                            end,
                            padding = { left = 1 }
                        },
                        -- disable all other elements of the file_info component
                        file_icon = false,
                        file_modified = false,
                        file_read_only = false,
                        -- use no separator for this part but define a background color
                        surround = {
                            separator = "none",
                            color = "file_info_bg",
                            condition = false
                        }
                    }
                },
                -- the final component of the NvChad statusline is the navigation section
                -- this is very similar to the previous current working directory section with the icon
                {     -- make nav section with icon border
                    -- define a custom component with just a file icon
                    status.component.builder {
                        { provider = utils.get_icon "ScrollText" },
                        -- add padding after icon
                        padding = { right = 1 },
                        -- set the icon foreground
                        hl = { fg = "bg" },
                        -- use the right separator and define the background color
                        -- as well as the color to the left of the separator
                        surround = {
                            separator = "right",
                            color = {
                                main = "nav_icon_bg",
                                left = "file_info_bg"
                            }
                        }
                    },
                    -- add a navigation component and just display the percentage of progress in the file
                    status.component.nav {
                        -- add some padding for the percentage provider
                        percentage = { padding = { right = 1 } },
                        -- disable all other providers
                        ruler = false,
                        scrollbar = false,
                        -- use no separator and define the background color
                        surround = {
                            separator = "none",
                            color = "file_info_bg"
                        }
                    }
                }
                -- remove the 2nd mode indicator on the right
            }

            -- return the final configuration table
            return opts
        end
    }, {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {}
            require('telescope').load_extension('projects')
        end,
        event = "VeryLazy",
        dependencies = { "nvim-telescope/telescope.nvim" }
    }, {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "node_modules", ".git", "target", "dist", ".godot",
                    ".cargo", "yarn.lock", "Cargo.lock", ".next"
                }
            }
        }
    }, { "seandewar/nvimesweeper", event = "VeryLazy" }, {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools")
            local extension_path = vim.env.HOME ..
                '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
            local codelldb_path = extension_path .. 'adapter/codelldb'
            local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
            rt.setup({
                server = {
                    settings = {
                            ['rust-analyzer'] = {
                            checkOnSave = {
                                allFeatures = true,
                                overrideCommand = {
                                    'cargo', 'clippy', '--workspace',
                                    '--message-format=json',
                                    '--all-targets', '--all-features'
                                }
                            },
                            cargo = { buildScripts = { enable = true } }
                        }
                    },
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "<C-space>",
                            rt.hover_actions.hover_actions,
                            { buffer = bufnr })
                        -- Code action groups
                    end
                },
                tools = {
                    autoSetHints = true,
                    runnables = { use_telescope = true },
                    inlay_hints = {
                        show_parameter_hints = true,
                        parameter_hints_prefix = "<- ",
                        other_hints_prefix = "=> "
                    },
                    hover_actions = { auto_focus = true }
                },
                dap = {
                    adapter = require('rust-tools.dap').get_codelldb_adapter(
                        codelldb_path, liblldb_path)
                }
            })
        end,
        event = "VeryLazy",
        dependencies = { "neovim/nvim-lspconfig" }
    }, {
        "uga-rosa/ccc.nvim",
        event = "VeryLazy",
        config = function()
            vim.opt.termguicolors = true

            local ccc = require("ccc")
            local mapping = ccc.mapping
            ccc.setup({
                highlighter = {
                    auto_enable = true,
                    filetypes = {
                        "c", "cpp", "rust", "go", "python", "lua",
                        "javascript", "typescript", "typescriptreact",
                        "javascriptreact"
                    }
                }
            })
        end
    }, {
        "AstroNvim/astrocommunity",
        { import = "astrocommunity.colorscheme.everforest", enabled = true }
        -- ... import any community contributed plugins here
    }, { "lewis6991/gitsigns.nvim", opts = { debug_mode = true } },
        { "zyedidia/vim-snake",      event = "VeryLazy" }, {
        "jose-elias-alvarez/typescript.nvim",
        event = "VeryLazy",
        config = function() require("typescript").setup({}) end
    }
    },
    -- Customize Heirline options
    heirline = {
        separators = {
            left = { "", " " }, -- separator for the left side of the statusline
            right = { " ", "" } -- separator for the right side of the statusline
        },
        attributes = { mode = { bold = true } },
        colors = function(hl)
            -- use helper function to get highlight group properties
            local utils = require("astronvim.utils")
            local comment_fg = utils.get_hlgroup("Comment").fg
            hl.git_branch_fg = comment_fg
            hl.blank_bg = utils.get_hlgroup("Folded").fg
            hl.file_info_bg = utils.get_hlgroup("Visual").bg
            hl.nav_icon_bg = utils.get_hlgroup("String").fg
            hl.nav_fg = hl.nav_icon_bg
            hl.folder_icon_bg = utils.get_hlgroup("Error").fg
            return hl
        end,
        icon_highlights = { file_icon = { statusline = false } }
        -- -- Customize different separators between sections
        -- separators = {
        --   breadcrumbs = " > ",
        --   tab = { "", "" },
        -- },
        -- -- Customize colors for each element each element has a `_fg` and a `_bg`
        -- colors = function(colors)
        --   colors.git_branch_fg = require("core.utils").get_hlgroup "Conditional"
        --   return colors
        -- end,
        -- -- Customize attributes of highlighting in Heirline components
        -- attributes = {
        --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
        --   git_branch = { bold = true }, -- bold the git branch statusline component
        -- },
        -- -- Customize if icons should be highlighted
        -- icon_highlights = {
        --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
        --   file_icon = {
        --     winbar = false, -- Filetype icon in the winbar inactive windows
        --     statusline = true, -- Filetype icon in the statusline
        --     tabline = true, -- Filetype icon in the tabline
        --   },
        -- },
    },
    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
        --
        vim.g.transparent_enabled = true
        vim.cmd [[
        set guicursor+=i:blinkon1
        nnoremap x "_x
        nnoremap d "_d
        nnoremap D "_D
        vnoremap d "_d
        ]]
        vim.schedule(function()
            vim.cmd [[
            call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
            \ 'highlights': {
            \   'border': 'Normal',
            \ },
            \ 'border': 'rounded',
            \ })))
            call wilder#setup({'modes': [':', '/', '?']})
            ]]
        end)
    end
}

return config
