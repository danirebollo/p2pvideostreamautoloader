$scriptlocation=(Get-Location).Path
. $scriptlocation\env.ps1

$a = ""
$abk = "";

do {    
    try {
        $a = (Invoke-WebRequest -URI $weblocation)
        $a=$a.ToString()
        $a = $a.Trim()
     }
     catch {
         $a=""
         $abk=""
     } 

    if ($a -notlike "") 
    {    
        $aceplayer = Get-Process ace_player -ErrorAction SilentlyContinue
        $aceengine = Get-Process ace_engine -ErrorAction SilentlyContinue
        Write-Output "aceplayer PROCESS:  -$aceplayer-. Aceengine: $aceengine "

        if (($abk -notlike $a) -or (!$aceplayer) -or (!$aceengine)) { #-or (!$chrome)
            Write-Output "New stream. Loading... -$a-"

            # check chrome process
            $chrome = Get-Process chrome -ErrorAction SilentlyContinue
                
            # get aceplayer process
            $aceplayer = Get-Process ace_player -ErrorAction SilentlyContinue
            if ($aceplayer) {
                Write-Output "Closing ace_player... -$a-"
                # try gracefully first
                $aceplayer.CloseMainWindow()
                Start-Sleep 2
                if (!$aceplayer.HasExited) {
                    $aceplayer | Stop-Process -Force
                }
            }
            Remove-Variable aceplayer

            # get aceengine process
            $aceengine = Get-Process ace_engine -ErrorAction SilentlyContinue
            if ($aceengine) {

                Write-Output "Closing ace_engine... -$a-"
                # try gracefully first
                $aceengine.CloseMainWindow()
                Start-Sleep 2
                if (!$aceengine.HasExited) {
                    $aceengine | Stop-Process -Force
                }
            }
            Remove-Variable aceengine
        
            Write-Output "Loading stream... -$a-"
            Set-location $acestreamlocation
            .\ace_player.exe acestream://$a --fullscreen --play-and-exit --volume=100 acestream://quit
            Set-location $scriptlocation

            if (!$chrome) {
                $chrome = Get-Process chrome -ErrorAction SilentlyContinue
                if ($chrome) {
                    Write-Output "Closing ace_player... -$a-"
                    # try gracefully first
                    $chrome.CloseMainWindow()
                    Start-Sleep 2
                    if (!$chrome.HasExited) {
                        $chrome | Stop-Process -Force
                    }
                }
            }
            Remove-Variable chrome
        }
        Write-Output "Readed TXT: -$a-. BK: -$abk-"
        $abk = $a;
        
    }
    else {
        Write-Output "CAUTION. Check internet."
    }
    Start-Sleep 5
}
while ($a -notlike "sdwn")
Write-Output "-----------BYE-----------"