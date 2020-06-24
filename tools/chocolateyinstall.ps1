$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/10-9-0/nRF-Command-Line-Tools_10_9_0_Installer_64.exe'
  softwareName  = 'nrfjprog*'
  checksum      = '66d5468b1c889898cad0afa28aa08cbebed69faffc8819f94dda09aee0d587a7'
  checksumType  = 'sha256'
  silentArgs    = "/passive /quiet /norestart /log `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1618, 1641)
}
Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath "$JLINK_BIN_PATH" -PathType 'Machine'
Install-ChocolateyPath "$NRF_BIN_PATH" -PathType 'Machine'
