$ErrorActionPreference = 'Stop';
. "$(Join-Path $toolsDir commonEnv.ps1)"

$path = [System.Environment]::GetEnvironmentVariable('PATH', 'Machine')
$path = ($path.Split(';') | Where-Object { $_ -ne "$JLINK_BIN_PATH" }) -join ';'
$path = ($path.Split(';') | Where-Object { $_ -ne "$NRF_BIN_PATH" }) -join ';'
[System.Environment]::SetEnvironmentVariable('PATH', $path, 'Machine')

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'nrfjprog*'
  fileType      = 'EXE'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}
$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']
if ($key.Count -eq 1) {
  $key | % {
    $packageArgs['file'] = "$($_.UninstallString)"
    if ($packageArgs['fileType'] -eq 'MSI') {
      $packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"
      $packageArgs['file'] = ''
    } else {
    }
    Uninstall-ChocolateyPackage @packageArgs
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}
