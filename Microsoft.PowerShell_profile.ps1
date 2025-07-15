& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\custom.omp.json" --print) -join "`n"))

Import-Module npm-completion
Import-Module posh-git
Import-Module z
Import-Module PSReadLine
Import-Module Terminal-Icons

$env:POSH_GIT_ENABLED = $true
$env:LESSCHARSET='utf-8'
$GitPromptSettings.EnableStashStatus = $true
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(65001);

function getprocess($Port) {
  Get-Process -Id(Get-NetTCPConnection -LocalPort $Port).OwningProcess
}

function gitdels($Code) {
  git branch -D @(git branch | select-string "$Code" | Foreach {$_.Line.Trim()})
  Write-Output 'Remaining branches:'
  git branch
}

# 设置WSL防火墙策略
function addWsl2NFW {
  New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
}

# 获取最后一条git log
function getLastGitLog {
  $gitlogInfo = git log -1 --pretty=format:"%s"
  Write-Output $gitlogInfo
  Set-Clipboard -Value $gitlogInfo
}

# 新建Chrome进程
function chrome($Url) {
  Start-Process "chrome.exe" $Url
}

# 新建Edge进程
function edge($Url) {
  Start-Process "msedge" $Url
}

function zcode($Path) {
  z $Path && code . 
}

Set-Alias -Name open -Value explorer
Set-Alias -Name VDI -Value SangforCSClient
Set-Alias -Name touch -Value New-Item
# Set-Alias -Name dk -Value docker
# 压缩目录
Set-Alias -Name zip -Value Compress-Archive

# PSReadLine Tab 键设置菜单补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete