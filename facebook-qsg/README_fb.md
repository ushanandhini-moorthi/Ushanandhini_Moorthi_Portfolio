# Facebook Quick Start Guide — Documentation Sample

## Overview

This project is a sample documentation set created for portfolio purposes.  
It demonstrates how to write a professional **Quick Start Guide (QSG)** for end users using a docs-as-code workflow.

The guide explains how users can create different types of Facebook posts from both web browsers and mobile apps.

---

## Documentation Included

- Quick Start Guide (Markdown source):
  - `source/markdown/quick_Start.md`

---

## Target Audience

- Facebook users who want quick instructions for creating posts
- Support or enablement teams
- Beginner to intermediate users

---

## Tools and Technologies

- Markdown (authoring)
- Visual Studio Code
- Pandoc (HTML and PDF generation)
- XeLaTeX (PDF engine)
- GitHub

---


---

## View the Output

### HTML

Open locally or via GitHub Pages:


### PDF

Download:


---

## Automated Output Generation

This project uses a PowerShell script to generate HTML and PDF outputs from the Markdown source.

The script:

- Converts Markdown to styled HTML
- Generates PDF output with custom fonts
- Resolves image paths from the assets folder
- Uses GitHub-flavored Markdown parsing
- Produces portfolio-ready deliverables

---

## Generate the Output

Run the following command from the repository root to generate the HTML and PDF files:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\generate-docs.ps1


