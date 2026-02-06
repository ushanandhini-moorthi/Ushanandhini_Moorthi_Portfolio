@echo off
REM Markdown to HTML and PDF Conversion Script
REM This script converts Markdown files to both HTML and PDF formats
REM Usage: convert-markdown.bat "path\to\file.md"

setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Usage: convert-markdown.bat "input.md"
    echo.
    echo Examples:
    echo   convert-markdown.bat "PrometheusObervability\prometheus-to-otlp.md"
    echo   convert-markdown.bat "..\PrometheusObervability\prometheus-to-otlp.md"
    exit /b 1
)

set "InputFile=%~1"
set "ResourcePath=%~dp1"
set "BaseName=%~n1"
set "NameWithoutExt=%BaseName:~0,-3%"

REM Set output paths
set "HtmlOutput=..\output\html\!NameWithoutExt!.html"
set "PdfOutput=..\output\PDF\!NameWithoutExt!.pdf"

echo.
echo ========================================
echo Markdown to HTML and PDF Converter
echo ========================================
echo.
echo Input:       !InputFile!
echo HTML Output: !HtmlOutput!
echo PDF Output:  !PdfOutput!
echo.

REM Create output directories if they don't exist
if not exist "..\output\html" mkdir "..\output\html"
if not exist "..\output\PDF" mkdir "..\output\PDF"

REM Generate HTML
echo [1/2] Converting to HTML...
pandoc "!InputFile!" ^
    -o "!HtmlOutput!" ^
    --from=gfm+hard_line_breaks ^
    --standalone ^
    --resource-path="!ResourcePath!"

if %ERRORLEVEL% EQU 0 (
    echo [OK] HTML generated: !HtmlOutput!
) else (
    echo [ERROR] HTML generation failed!
    exit /b 1
)

echo.

REM Generate PDF
echo [2/2] Converting to PDF...
pandoc "!InputFile!" ^
    -o "!PdfOutput!" ^
    --from=gfm+hard_line_breaks ^
    --pdf-engine=xelatex ^
    --resource-path="!ResourcePath!" ^
    -V geometry:margin=1in ^
    -V mainfont="Times New Roman" ^
    -V monofont="Courier New"

if %ERRORLEVEL% EQU 0 (
    echo [OK] PDF generated: !PdfOutput!
) else (
    echo [ERROR] PDF generation failed!
    exit /b 1
)

echo.
echo ========================================
echo [SUCCESS] Both HTML and PDF created!
echo ========================================

endlocal
