# Markdown to HTML and PDF Conversion Script (PowerShell)
# This script converts a single Markdown file to both HTML and PDF formats
# Usage: .\convert-markdown.ps1 -InputFile "path\to\file.md"

param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,
    
    [Parameter(Mandatory=$false)]
    [string]$ResourcePath
)

# Verify input file exists
if (-not (Test-Path $InputFile)) {
    Write-Error "Input file not found: $InputFile"
    exit 1
}

# Set default resource path to input file directory
if (-not $ResourcePath) {
    $ResourcePath = Split-Path -Parent $InputFile
}

# Get file name without extension
$baseName = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)

# Set output paths (one level up from conversion-scripts folder)
$htmlOutput = "..\output\html\$baseName.html"
$pdfOutput = "..\output\PDF\$baseName.pdf"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Markdown to HTML and PDF Converter" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Input:       $InputFile" -ForegroundColor Yellow
Write-Host "HTML Output: $htmlOutput" -ForegroundColor Yellow
Write-Host "PDF Output:  $pdfOutput" -ForegroundColor Yellow
Write-Host ""

# Create output directories if they don't exist
@("..\output\html", "..\output\PDF") | ForEach-Object {
    if (-not (Test-Path $_)) {
        New-Item -ItemType Directory -Path $_ | Out-Null
    }
}

# Generate HTML
Write-Host "[1/2] Converting to HTML..." -ForegroundColor Green
pandoc "$InputFile" `
    -o "$htmlOutput" `
    --from=gfm+hard_line_breaks `
    --standalone `
    --resource-path="$ResourcePath"

if ($LASTEXITCODE -eq 0 -and (Test-Path $htmlOutput)) {
    $htmlSize = (Get-Item $htmlOutput).Length
    Write-Host "[OK] HTML generated: $htmlOutput ($htmlSize bytes)" -ForegroundColor Green
} else {
    Write-Error "HTML generation failed!"
    exit 1
}

Write-Host ""

# Generate PDF
Write-Host "[2/2] Converting to PDF..." -ForegroundColor Green
pandoc "$InputFile" `
    -o "$pdfOutput" `
    --from=gfm+hard_line_breaks `
    --pdf-engine=xelatex `
    --resource-path="$ResourcePath" `
    -V geometry:margin=1in `
    -V mainfont="Times New Roman" `
    -V monofont="Courier New"

if ($LASTEXITCODE -eq 0 -and (Test-Path $pdfOutput)) {
    $pdfSize = (Get-Item $pdfOutput).Length
    Write-Host "[OK] PDF generated: $pdfOutput ($pdfSize bytes)" -ForegroundColor Green
} else {
    Write-Error "PDF generation failed!"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "[SUCCESS] Both HTML and PDF created!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
