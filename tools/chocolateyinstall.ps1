$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRF-Command-Line-Tools_10_3_0_Installer_64.exe'
  softwareName  = 'nrfjprog*'
  checksum      = '3BD892FB54DF3E9F1230FFC7FAC268C960A9A8179FB82F1D70FBBE7BC54FB432'
  checksumType  = 'sha256'
  silentArgs    = "/passive /quiet /norestart /log `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1618, 1641)
}
Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath "$JLINK_BIN_PATH" -PathType 'Machine'
Install-ChocolateyPath "$NRF_BIN_PATH" -PathType 'Machine'
