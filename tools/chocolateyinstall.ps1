$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/nrf-command-line-tools/sw/versions-10-x-x/10-21-0/nrf-command-line-tools-10.21.0-x64.exe'
  softwareName  = 'nrfjprog*'
  checksum      = '9DFE32A5373A76A453B709FE7B6CD4957731EFAE2A43073BDB9E9FF275F04A34'
  checksumType  = 'sha256'
  silentArgs    = "/passive /quiet /norestart /log `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1618, 1641)
}
Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath "$JLINK_BIN_PATH" -PathType 'Machine'
Install-ChocolateyPath "$NRF_BIN_PATH" -PathType 'Machine'
