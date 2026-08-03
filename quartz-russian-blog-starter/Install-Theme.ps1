param(
  [string]$Target = "."
)

$Source = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not (Test-Path (Join-Path $Target "package.json")) -or
    -not (Test-Path (Join-Path $Target "quartz"))) {
  Write-Error "'$Target' не похож на корень установленного Quartz 5."
  exit 1
}

Copy-Item (Join-Path $Source "quartz.config.yaml") (Join-Path $Target "quartz.config.yaml") -Force
New-Item -ItemType Directory -Force -Path (Join-Path $Target "quartz/styles") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Target "content") | Out-Null
Copy-Item (Join-Path $Source "quartz/styles/custom.scss") (Join-Path $Target "quartz/styles/custom.scss") -Force
Copy-Item (Join-Path $Source "content/*") (Join-Path $Target "content") -Recurse -Force

Write-Host "Файлы темы установлены."
Write-Host "Теперь выполните:"
Write-Host "  cd `"$Target`""
Write-Host "  npx quartz plugin install --from-config"
Write-Host "  npx quartz build --serve"
