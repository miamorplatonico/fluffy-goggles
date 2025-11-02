# start-server.ps1
# Activa un virtualenv (si existe) y arranca el servidor de desarrollo de Django
# Uso: Ejecutar desde PowerShell en la carpeta `techno_star` o haciendo doble click en el archivo.

$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $root

# Rutas comunes para activate.ps1
$venvPaths = @(
    ".\venv\Scripts\Activate.ps1",
    ".\venv#\Scripts\Activate.ps1",
    ".\.venv\Scripts\Activate.ps1"
)
$activated = $false
foreach ($p in $venvPaths) {
    if (Test-Path $p) {
        Write-Output "Activando entorno virtual: $p"
        & $p
        $activated = $true
        break
    }
}
if (-not $activated) {
    Write-Output "No se encontró entorno virtual en rutas comunes. Si usas un venv, actívalo manualmente antes de ejecutar este script."
}

Write-Output "Arrancando servidor Django en http://127.0.0.1:8000/ (presiona Ctrl+C o Ctrl+Break para detener)..."
python .\manage.py runserver 127.0.0.1:8000
