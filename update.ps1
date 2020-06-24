import-module au

$domain   = 'https://www.nordicsemi.com'
$releases = "$domain/Software-and-tools/Development-Tools/nRF-Command-Line-Tools/Download#infotabs"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
  }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
  $regex    = 'sc_DownloadFiles_CommandLineTools'
  $url_raw  = $download_page.links | ? id -match $regex | select -First 1 -expand href
  $url_x64  = $url_raw -replace '.exe','_64.exe'
  $url      = ($domain, $url_x64) -Join('')

  $token = $url -split 'nRF-Command-Line-Tools_' | select -First 1 -Skip 1 #3
  $raw_version = $token -split '_Installer_64.exe' | select -Last 1 -Skip 1 #3
  $version = $raw_version -replace '_','.'
  return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32
