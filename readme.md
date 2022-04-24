# Description
Windows script to load p2p/acestream id from external URL at boot in fullscreen mode.

# Steps
1- Enable powershell scripts. Open powershell with admin rights and run
```
set-executionpolicy remotesigned
```

2- create env.ps1 (check "env.ps1 content")

3- test script
```
.\ex.bat
```

4- ~~put shortcut in "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" to autoload at boot~~ 

Not needed anymore. Script creates a shortcut in startup folder automatically.

5- Put desired p2p/acestream id in $weblocation. Your web only need to have the id. Nothing more than this. You can use github pages to store this web. Create str1.html with this content
```
ba81781d1301a92a795faf7366e860294634f116
```
now you're done.

# env.ps1 content 
```
$acestreamlocation = "C:\Users\{user}\AppData\Roaming\ACEStream\player"
$weblocation="https://myweb.com/str1.html"
```
# TODO 
[ ] using linux/rpi: https://github.com/goncalomb/acestream-rpi