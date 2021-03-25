[Cmdletbinding()]
Param(
    [Parameter(Position = 0, Mandatory = $true)][string]$AppSettingsPath,
    [Parameter(Position = 1, Mandatory = $true)][string]$TemplateFolderPath,
    [Parameter(Position = 2, Mandatory = $true)][string]$OutputFolderPath
)

try {      
    $AppSettings = Get-Content $(Get-Item $AppSettingsPath).FullName | ConvertFrom-Json
    $TemplateFolderFullName = $(Get-Item $TemplateFolderPath).FullName
    $TemplateFolderName = $(Get-Item $TemplateFolderFullName).BaseName  
    $RootPath = $(Get-Item $OutputFolderPath).FullName
    $CountFile = 0

    # Iterate through Template files
    Get-ChildItem $TemplateFolderFullName -Recurse -Include *.html, *.css, *.js | Foreach-Object {
        $File = $_
        $OutputFilename = $File.NameString
        $DirectoryName = $File.Directory.BaseName
        $CountFile++

        # Iterate through Environments
        $AppSettings.Environments.GetEnumerator() | Select-Object Name, PolicySettings | ForEach-Object {            
            $Env = $_
            $Content = Get-Content $File.FullName -Raw
            $PolicySettings = $Env.PolicySettings | ConvertTo-Json | ConvertFrom-Json -AsHashTable
            
            # Iterate through Settings
            $PolicySettings.GetEnumerator() | Select-Object Name, Value | ForEach-Object {
                $Setting = $_
                if ($null -ne $Content) {
                    # Replace tokens : {Settings:<Name>}
                    $Content = $Content -replace "{Settings:$($Setting.Name)}", $Setting.Value

                    # If statement : {If:<Name>} Content {EndIf:<Name>}                    
                    [regex]$IfPattern = "(?ms){If:$($Setting.Name)}(.*?){EndIf:$($Setting.Name)}"
                    
                    if ($IfPattern.Match($Content).Success) {                        
                        if ($Setting.Value -eq $true) {                    
                            $Content = $Content -replace "{If:$($Setting.Name)}", $null -replace "{EndIf:$($Setting.Name)}", $null                            
                        }
                        else {
                            $Content = $Content -replace $IfPattern, $null 
                        }
                    }             
                }                              
            }
        
            $OutputFilePath = Join-Path $RootPath $AppSettings.EnvironmentsFolder $Env.Name $TemplateFolderName $DirectoryName

            if ((Test-Path -Path $OutputFilePath -PathType Container) -ne $true) {
                $null = New-Item -ItemType Directory -Force -Path $OutputFilePath
            }
            
            # Write output file
            $Content | Out-File $(Join-Path $OutputFilePath $OutputFilename)
        }

        Write-Verbose "$($OutputFilename) => Builded."
    }
    
    Write-Host "`n✔️ Build Succeeded! $($CountFile) files, $($AppSettings.Environments.Count) environments.`n"
}
catch {
    Write-Host "`n❌ Error occured in BuildWeb.ps1.`n"
    Write-Host $_
    exit 1
}

exit 0