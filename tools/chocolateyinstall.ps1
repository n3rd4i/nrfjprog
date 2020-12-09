$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/10-12-1/nRF-Command-Line-Tools_10_12_1_Installer_64.exe'
  softwareName  = 'nrfjprog*'
  checksum      = '0d8e73e3e8f086a84e10867f4bc1ef417dff72e2eb83842216268fa986167862'
  checksumType  = 'sha256'
  silentArgs    = "/passive /quiet /norestart /log `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1618, 1641)
}
Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath "$JLINK_BIN_PATH" -PathType 'Machine'
Install-ChocolateyPath "$NRF_BIN_PATH" -PathType 'Machine'
