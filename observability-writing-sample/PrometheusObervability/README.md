# Project Overview

Overview
--------
This project is a small docs-as-code sample for a portfolio. The guide explains how to configure a Prometheus receiver in the OpenTelemetry Collector to scrape histograms from an application's /metrics endpoint, transform cumulative histogram buckets into deltas (e.g., via cumulativetodelta), and export the resulting OTLP metrics to an OTLP-compatible backend. It covers validating scrapes and exports, and notes security considerations (TLS/auth and network egress) needed for production.
 
Contents
--------
- Source Markdown: `prometheus-to-otlp.md` 

Tools and Technologies
----------------------
- Markdown (authoring)
- Pandoc (HTML and PDF generation)
- XeLaTeX / MiKTeX (PDF engine used by Pandoc)
- Windows Command Prompt / PowerShell (scripts)


Output Paths
------------
- HTML: `PrometheusObervability/output/html/prometheus-to-otlp.html`
- PDF:  `PrometheusObervability/output/PDF/prometheus-to-otlp.pdf`

Automated Output Generation
---------------------------
This project includes two scripts that perform the conversion:

- `convert-markdown.bat` — Batch script that generates both HTML and PDF (easy to run from CMD)
- `convert-markdown.ps1` — PowerShell script with descriptive output (useful in PowerShell sessions)

How to Generate the Outputs
---------------------------
Open a terminal and change to the conversion scripts folder, then run one of the scripts.
