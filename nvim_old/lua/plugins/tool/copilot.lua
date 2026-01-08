return {{
    "robitx/gp.nvim",

    config = function()
        local conf = {
            openai_api_key = 'sk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
            provider = {
                openai = {
                    disabled = true
                },
                copilot = {
                    disabled = false,
                    endpoint = "https://api.githubcopilot.com/chat/completions",
                    "powershell",
                    "-Command",
                    '(Get-Content $env:LOCALAPPDATA\\github-copilot\\apps.json -Raw | ConvertFrom-Json)."github.com:Iv1.b507a08c87ecfe98".oauth_token'
                }

            },
            agents = {{
                name = "MyCustomAgent",
                provider = "copilot",
                chat = true,
                command = true,
                model = {
                    model = "gpt-4-turbo"
                },
                system_prompt = "Answer any query with just: Sure thing.."
            }}
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end
}, {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            enabled = false
        },
        panel = {
            enabled = false
        },
        filetypes = {
            markdown = true,
            help = true
        }
    }
}}
