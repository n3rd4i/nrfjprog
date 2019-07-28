$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir chocolateyhelper.ps1)"

$url        = 'https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRF-Command-Line-Tools_10_2_1_Installer_64.exe'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'nrfjprog*'
  checksum      = 'B707BB13D69DC8DC211AE4F43EFA72A36FEDD8B36E610C17548E01E9414E1DA0'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
$ahkProc = Start-Ahk('chocolateyhelper.ahk')

Install-ChocolateyPackage @packageArgs

Install-ChocolateyPath "$($env:SystemDrive)\Program Files (x86)\SEGGER\JLink_V644e" -PathType 'Machine'
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\Nordic Semiconductor\nrf-command-line-tools\bin" -PathType 'Machine'

# minimum delay to ensure the autohotkey takes efect
& Start-Sleep 1
if (Get-Process -id $ahkProc.Id -ErrorAction SilentlyContinue) {Stop-Process -id $ahkProc.Id}
