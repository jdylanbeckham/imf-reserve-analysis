# IMF Reserve Analytics — Data

This directory contains the source and processed datasets used in the reconstruction of the 2025 ADTA 4240 IMF Foreign Reserve Analytics project.

Large datasets are intentionally excluded from the public Git repository through `.gitignore`. This README documents their provenance and role in the analysis.

## Source

**Provider:** International Monetary Fund (IMF)  
**Original Project:** ADTA 4240 – Harvesting, Storing, and Retrieving Data  
**Original Analysis Date:** July 2025  
**Original Platform:** Google Cloud Storage / BigQuery  
**Primary Analytical Period:** 2020–2023

## `raw/`

Contains the original IMF data exports recovered from the 2025 coursework.

Recovered files:

- `dataset_2025-07-13T19_23_20.727694682Z_DEFAULT_INTEGRATION_IMF.STA_IL_12.0.0.csv`
- `dataset_2025-07-13T19_23_20.727694682Z_DEFAULT_INTEGRATION_IMF.STA_IL_12.0.0(1).csv`

These files are preserved without modification.

The two recovered exports contain substantially the same IMF observations but include formatting differences. Both are retained locally until the reconstruction establishes which version should serve as the canonical raw source.

## `processed/`

Contains datasets produced during the original coursework through cleaning, reshaping, or analytical preparation.

Recovered files:

- `IMF_Dataset_Cleaned.csv`
- `IMF_Dataset_Cleaned.xlsx`
- `IMF_Dataset_Unpivoted_For_Tableau.csv`

The unpivoted dataset represents the long-format analytical structure used for visualization and analysis.

A duplicate recovered file, `IMF_Dataset_Unpivoted_WithDates.csv`, was excluded from the reconstruction workspace after confirming that it duplicated the retained unpivoted dataset.

## Reconstruction Policy

The recovered 2025 datasets are treated as historical project evidence.

PPAD reconstruction work will:

1. Preserve original source files.
2. Document transformations separately.
3. Reproduce analytical steps where supportable.
4. Validate reconstructed results against recovered evidence.
5. Clearly distinguish original coursework from 2026 PPAD enhancements.

No missing historical transformation or analytical step will be represented as original work unless supported by recovered evidence.