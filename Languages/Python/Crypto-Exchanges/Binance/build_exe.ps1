# Build a Windows .exe using PyInstaller
param(
  [string]$Python = "python",
  [string]$Icon = ""
)
$ErrorActionPreference = "Stop"
pushd $PSScriptRoot

# Create a simple spec on the fly
$iconArg = ""
if ($Icon -ne "") { $iconArg = "--icon `"$Icon`"" }

& $Python -m pip install --upgrade pip pyinstaller | Out-Null
& $Python -m PyInstaller main.py --name "Binance-Trading-Bot" --onefile $iconArg

Write-Host "Done. EXE at: dist\Binance-Trading-Bot\Binance-Trading-Bot.exe"
popd
