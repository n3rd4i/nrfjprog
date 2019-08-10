$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$url        = 'https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRF-Command-Line-Tools_10_2_1_Installer_64.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'nrfjprog*'
  checksum      = 'B707BB13D69DC8DC211AE4F43EFA72A36FEDD8B36E610C17548E01E9414E1DA0'
  checksumType  = 'sha256'
  silentArgs    = "/passive /quiet /norestart /log `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath "$JLINK_BIN_PATH" -PathType 'Machine'
Install-ChocolateyPath "$NRF_BIN_PATH" -PathType 'Machine'
