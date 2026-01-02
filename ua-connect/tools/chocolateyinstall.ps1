$ErrorActionPreference = 'Stop'

$url = 'https://www.uaudio.com/apps/uaconnect/win/installer'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'UA Connect*'
  checksum      = '880A26EA8C8AE1A41B52934C6C839C55FFA218333B9196BAE0371833468F0033'
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
