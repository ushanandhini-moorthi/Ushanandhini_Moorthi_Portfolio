cd "C:\Users\Sudhakar\Documents\Ushanandhini Moorthi\Portfolio\Ushanandhini_Moorthi_Portfolio"

# Generate HTML with CSS styling for code blocks
pandoc "facebook-qsg\source\markdown\quick_Start.md" -o "facebook-qsg\output\html\quick_Start.html" --from=gfm+hard_line_breaks --standalone --resource-path="facebook-qsg/source/markdown;facebook-qsg/assets"

# Generate PDF with monospace font for code
pandoc "facebook-qsg\source\markdown\quick_Start.md" -o "facebook-qsg\output\pdf\quick_Start.pdf" --from=gfm+hard_line_breaks --pdf-engine=xelatex --resource-path="facebook-qsg/source/markdown;facebook-qsg/assets" -V geometry:margin=1in -V mainfont="Times New Roman" -V monofont="Courier New"

Write-Host "Done! HTML and PDF generated."
