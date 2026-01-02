$ErrorActionPreference = 'Stop'

$uninstallKeys = @(
  'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
  'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
)

$app = Get-ItemProperty $uninstallKeys -ErrorAction SilentlyContinue |
  Where-Object {
    $_.DisplayName -like 'UA Connect*' -or $_.DisplayName -like 'Universal Audio*'
  } |
  Select-Object -First 1

if ($app -and $app.UninstallString) {
  Start-Process cmd.exe "/c $($app.UninstallString)" -Wait -NoNewWindow
}
