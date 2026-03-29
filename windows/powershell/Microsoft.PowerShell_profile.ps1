# --- Autocomplete / PSReadLine ---
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# --- WinGet package paths (fzf, bat, eza, delta) ---
$env:Path = ((Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Directory | ForEach-Object { $_.FullName }) -join ';') + ";$env:Path"

# --- Modules ---
Import-Module Terminal-Icons
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# --- Zoxide (smart cd) ---
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# --- Aliases ---
Set-Alias -Name lg -Value lazygit
function ll { eza -la --icons --group-directories-first --no-user --no-permissions --time-style relative @args }
function ls { eza --icons --group-directories-first @args }
function tree { eza --tree --icons --level=3 @args }
function cat { bat --style=auto --paging=never @args }

# --- Oh My Posh (must be last) ---
oh-my-posh init pwsh --config "$HOME/.config/oh-my-posh/theme.omp.json" | Invoke-Expression
