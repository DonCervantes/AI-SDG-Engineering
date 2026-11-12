# Crea un run de hackathon desde las plantillas.
# Uso: .\scripts\new-run.ps1 nombre-del-equipo
#      .\scripts\new-run.ps1 nombre-del-equipo -WithBaseline -WithAdr

param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$TeamSlug,
    [switch]$WithBaseline,
    [switch]$WithAdr,
    [switch]$WithStageContract
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$slug = ($TeamSlug.ToLower() -replace '\s+', '-' -replace '[^a-z0-9\-]', '')
if (-not $slug) { throw "Slug de equipo invalido." }

$date = Get-Date -Format "yyyy-MM-dd"
$run = Join-Path ".ai\runs" "$date-$slug"

if (Test-Path $run) { throw "Ya existe: $run" }

New-Item -ItemType Directory -Path $run -Force | Out-Null
Copy-Item ".ai\CONTEXT.md" (Join-Path $run "CONTEXT.md")
$templates = @(
    "01-idea.md", "02-architecture.md", "03-build-slice.md",
    "04-verification.md", "05-pitch.md", "design-brief.md"
)
foreach ($t in $templates) {
    Copy-Item (Join-Path "templates" $t) (Join-Path $run $t)
}
if ($WithBaseline) {
    Copy-Item ".ai\references\baseline.md" (Join-Path $run "baseline.md")
}
if ($WithStageContract) {
    Copy-Item "templates\stage-contract.md" (Join-Path $run "stage-contract.md")
}
if ($WithAdr) {
    $adrDir = ".ai\adr"
    if (-not (Test-Path $adrDir)) { New-Item -ItemType Directory -Path $adrDir -Force | Out-Null }
    Copy-Item "templates\adr.md" (Join-Path $adrDir "0001-borrador.md")
}

Write-Host "Run creado: $run"
Write-Host "1) Edita $run\CONTEXT.md (reloj, freeze, repo de codigo)."
Write-Host "2) En .ai\CONTEXT.md pon Run actual: $run"
Write-Host "3) Sigue PLAYBOOK.md (waves en 03-build-slice.md)."
