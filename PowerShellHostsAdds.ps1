CLS 
Import-CSV "C:\Scripts\Servers.csv" | % {  
    $Server = $_.ServerName 
    $adminpath = Test-Path "\\$Server\admin$" 
    If ($adminpath -eq "True") 
        { 
         $hostfile = "\\$Server\c$\Windows\System32\drivers\etc\hosts" 
         Write-Host –NoNewLine "Updating $Server..." 
            "192.168.64.71`ezd-cdr ezd-cdr-proxy ezd-cdr-static" | Out-File $hostfile -encoding ASCII -append
	 	    "192.168.64.73`ezd-cdrtest ezd-cdrtest-proxy ezd-cdrtest-static" | Out-File $hostfile -encoding ASCII -append
	 	    "192.168.64.81`ezd-test ezd-test-proxy ezd-test-static" | Out-File $hostfile -encoding ASCII -append
         Write-Host "Done!"  
          
            
        } 
    Else  
        { 
            Write-Host -Fore Red "Can't Access $Server" 
        } 
    } 