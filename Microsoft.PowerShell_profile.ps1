# & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" --print) -join "`n"))
# & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\agnoster.omp.json" --print) -join "`n"))
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\custom.omp.json" --print) -join "`n"))

function runzookeeper {  
  D:\\Program\\kafka_2.13-3.2.1\\bin\\windows\\zookeeper-server-start.bat D:\\Program\\kafka_2.13-3.2.1\\config\\zookeeper.properties
}
function stopzookeeper {
  D:\\Program\\kafka_2.13-3.2.1\\bin\\windows\\zookeeper-server-stop.bat
}
function runkafka {
  D:\\Program\\kafka_2.13-3.2.1\\bin\windows\kafka-server-start.bat D:\\Program\\kafka_2.13-3.2.1\\config\server.properties
}
function stopkafka {
  D:\\Program\\kafka_2.13-3.2.1\\bin\\windows\\kafka-server-stop.bat
}
function gomysql {
  mysql -uroot -p'VDBI&uTb*t' 
}
function runmysql {
  net start mysql
}
function stopmysql {
  net stop mysql
}
function gomysql5.7 {
  mysql -uroot -p'VDBI&uTb*t' -P3307
}
function runmysql5.7 {
  net start mysql5.7
}
function stopmysql5.7 {
  net stop mysql5.7
}
function runOpenLDAP {
  net start OpenLDAP-slapd
}
function stopOpenLDAP {
  net stop OpenLDAP-slapd
}
function goubuntu {
  Set-Location \\wsl$\Ubuntu-18.04\root
}
function getprocess($Port){
  Get-Process -Id(Get-NetTCPConnection -LocalPort $Port).OwningProcess
}

Set-Alias -Name open -Value explorer
Set-Alias -Name VDI -Value SangforCSClient
Set-Alias -Name touch -Value New-Item
Set-Alias -Name dk -Value docker

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module npm-completion
Import-Module posh-git