﻿
#Write-Output "";
#$nombreObjecto = read-host " Buscar objeto"
#Write-Output "";

$datos = Get-Content ".\scripts\obj\gui\docs\buscarobjgui.txt"

#echo $datos

        try {
            Get-ADObject -Filter "Name -eq '$datos'" > .\scripts\obj\gui\docs\buscarobjgui.txt
            
            $contador = (Get-Content .\scripts\obj\gui\docs\buscarobjgui.txt | where{$_-match"$datos"}).Count

            if ($contador -ne 0) {

                #$datos
                echo 0 > .\scripts\obj\gui\docs\compobj.txt

                Get-ADObject -Filter "Name -eq '$datos'" > .\scripts\obj\gui\docs\buscarobjgui.txt

                #$salida = Get-ADObject -Filter "Name -eq '$datos'"

                #echo $salida > .\scripts\obj\docs\buscarobjgui2.txt

                #$ruta = .\scripts\obj\docs\buscarobjgui2.txt

                #$salida | Out-File -FilePath $ruta
            }

            else {

                #Write-Host " El objeto $datos no existe" -ForegroundColor DarkRed

                echo 100 > .\scripts\obj\gui\docs\compobj.txt

            }

        }

        catch [System.Management.Automation.RuntimeException] {

            if ($_.Exception.Message -ilike "Error"){
            }

            #Write-Host " Debe introducir algún dato" -ForegroundColor DarkRed

            echo 100 > .\scripts\obj\gui\docs\compobj.txt
        }



