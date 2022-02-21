import-module au

$domain   = 'https://www.nordicsemi.com'
$releases = "$domain/Products/Development-Tools/nRF-Command-Line-Tools/Download"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
  }
}
function global:au_GetLatest {
  $extension = '-x64.exe'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
  $regex    = 'sc_DownloadFiles_CommandLineTools'
  $url_raw  = $download_page.links | ? id -match $regex | select -First 1 -expand href
  $url_x64  = $url_raw -replace '-x86.exe', $extension
  $url      = ($domain, $url_x64) -Join('')

  $token = $url -split 'nRF-Command-Line-Tools-' | select -First 1 -Skip 1 #3
  $version = $token -split $extension | select -Last 1 -Skip 1 #3
  return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32
