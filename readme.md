# Description
Windows script to load p2p/acestream id from external URL at boot in fullscreen mode.

# Steps
1- create env.ps1 (check "env.ps1 content")
2- test script running ".\ex.bat" in terminal
3- put shortcut in "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" to autoload at boot
4- Put desired p2p/acestream id in $weblocation. Your web only need to have the id. Nothing more than this. You can use github pages to store this web. Create str1.html with this content: "ba81781d1301a92a795faf7366e860294634f116" and you're done.

# env.ps1 content 
$acestreamlocation = "C:\Users\{user}\AppData\Roaming\ACEStream\player"
$weblocation="https://myweb.com/str1.html"

# TODO 
[] using linux/rpi: https://github.com/goncalomb/acestream-rpi
