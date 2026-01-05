# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module -Name Microsoft.WinGet.CommandNotFound

Import-Module posh-git
Import-Module -Name Terminal-Icons
Invoke-Expression (&starship init powershell --print-full-init | Out-String)
# PSReadLine
# Set-PSReadLineOption -EditMode Emacs 
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle Visual # Visual, None, Audible
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView # InlineView, ListView
# Set-PSReadLineOption -HistoryNoDuplicates TRUE # không lưu lịch sử trùng nhau
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$ENV:STARSHIP_CACHE = "$HOME\.config\starship\cache"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias g git
Set-Alias ls eza
Set-Alias file fpilot.exe
Set-Alias python3 python
# Set-Alias pip 'python -m pip'
# Set-Alias pip 'C:\Users\hydra7\scoop\apps\pyenv\current\pyenv-win\versions\3.13.6\python.exe -m pip --version'
# Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# fix lỗi pip trong pyenv
if (Get-Command python -ErrorAction SilentlyContinue) {
    try {
        $null = python -m pip --version 2>$null
        if ($LASTEXITCODE -eq 0) {
            function pip {
                python -m pip @args
            }
        }
    } catch {
        Write-Verbose "pip not available in current python"
    }
}

function ll {
    param (
        [switch]$a
    )

    if ($a) {
        eza -l -a
    } else {
        eza -l
    }
}


# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
