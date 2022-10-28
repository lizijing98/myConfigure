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
function getprocess($Port) {
  Get-Process -Id(Get-NetTCPConnection -LocalPort $Port).OwningProcess
}

# 设置WSL防火墙策略
function addWsl2NFW {
  New-NetFirewallRule -DisplayName "WSL" -Direction Inbound  -InterfaceAlias "vEthernet (WSL)"  -Action Allow
}

Set-Alias -Name open -Value explorer
Set-Alias -Name VDI -Value SangforCSClient
Set-Alias -Name touch -Value New-Item
Set-Alias -Name dk -Value docker

Import-Module npm-completion
Import-Module posh-git

# PSReadLine Tab 键设置菜单补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete