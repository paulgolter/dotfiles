# Put this file in: $profile (%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1)
Import-Module posh-git
Import-Module PSReadLine

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Up/Down arrows search history filtered by what's already typed
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
# Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord

