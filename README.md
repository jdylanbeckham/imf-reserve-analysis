\# IMF Reserve Analytics



Reconstruction and portfolio refinement of a University of North Texas

ADTA 4240 analytics project examining international reserve data from the

International Monetary Fund (IMF).



\## Project Overview



This project reconstructs an earlier academic analysis of IMF reserve data

using Google BigQuery, SQL, and Tableau.



The original coursework involved preparing IMF reserve data in Google Cloud,

querying the resulting dataset with SQL, and developing visualizations showing:



\- Top Reserve Holders (2023)

\- Global Reserves Over Time (2020–2023)



For this portfolio version, the original workflow was rebuilt, validated,

documented, and re-visualized while preserving the original analytical intent.



The reconstruction also identified several limitations in the original

analysis, including the presence of regional aggregates among country-level

results and the comparability limitations of the IMF's national-valuation

gold reserve measure.



\---



\## Objectives



The reconstruction was designed to:



\- Recover and document the original data-preparation workflow.

\- Rebuild the analytical dataset in Google BigQuery.

\- Reproduce the original SQL analysis.

\- Validate reporting entities and measurement definitions.

\- Recreate the original Tableau visualizations.

\- Improve presentation quality without changing the core coursework scope.

\- Preserve SQL, processed data, visualizations, and supporting evidence in a

&#x20; reproducible Git repository.

\- Prepare the project for presentation on jdylanbeckham.com.



\---



\## Tools \& Technologies



\- Google Cloud Platform

\- Google BigQuery

\- SQL

\- Tableau

\- CSV / Excel

\- Git

\- GitHub

\- International Monetary Fund reserve data



\---



\## Data Preparation



The source IMF dataset contained reserve observations across countries,

regional aggregates, institutions, indicators, and multiple time periods.



The reconstruction recreated the cleaned analytical dataset in BigQuery and

used SQL `UNPIVOT` operations where needed to convert year-based columns into

an analysis-ready year/value structure.



Primary analytical attention was placed on annual observations from

2020 through 2023.



Processed source and analytical datasets are retained in:



`data/processed/`



including cleaned, unpivoted, comparison, and visualization-ready CSV files.



\---



\## SQL Reconstruction



SQL artifacts are retained in the `/sql` directory as an audit trail of the

reconstruction and validation process.



\### Core Reconstruction



\#### `01\_reconstruct\_unpivot.sql`



Reconstructs the year/value structure used by the original coursework.



\#### `02\_gold\_reserves\_2023\_validation.sql`



Reproduces and validates the original 2023 gold-reserve analysis.



\#### `03\_gold\_reserves\_2023\_country\_filter.sql`



Removes IMF economic aggregates, regional groupings, and institutional

entities from the country/jurisdiction comparison.



\#### `04\_gold\_reserve\_rankings.sql`



Produces the cleaned Top 10 ranking used in the reconstructed portfolio

visualization.



\#### `08\_global\_reserves\_2020\_2023.sql`



Reconstructs the original Global Reserves (2020–2023) trend analysis by

aggregating annual gold reserves at national valuation across reporting

entities.



\### Exploratory Validation



The following SQL files were created during validation and are retained for

future analytical expansion:



\#### `05\_gold\_reserves\_volume\_2023.sql`



Ranks reporting entities using physical gold volume in millions of fine

troy ounces.



\#### `06\_gold\_reserves\_market\_value\_2023.sql`



Ranks reporting entities using the IMF market-value gold reserve measure.



\#### `07\_gold\_reserve\_comparison\_2023.sql`



Compares national valuation, physical-volume, and market-value rankings.



These exploratory analyses are preserved in the repository but are not part

of the initial reconstructed coursework presentation.



\---



\## Visualization 1 — Top Reserve Holders (2023)



The original coursework ranked reporting entities using the IMF indicator:



\*\*Gold reserves at national valuation\*\*



During reconstruction, the original result was found to include regional

economic aggregates among country-level entities.



For the portfolio reconstruction, regional and institutional aggregates were

removed to produce a consistent country/jurisdiction comparison.



The resulting Top 10 were:



1\. Germany

2\. Italy

3\. France

4\. Russian Federation

5\. China

6\. Switzerland

7\. Japan

8\. Türkiye

9\. India

10\. Netherlands



Values are reported in \*\*millions of U.S. dollars at national valuation\*\*.



!\[Top Reserve Holders 2023](images/top\_reserve\_holders\_2023.png)



The reconstructed Tableau workbook is retained as:



`Top Reserve Holders (2023).twb`



\---



\## Visualization 2 — Market Trends: Global Reserves (2020–2023)



The second original coursework visualization examined changes in aggregate

gold reserves at national valuation between 2020 and 2023.



The reconstructed totals were approximately:



| Year | Global Reserves |

| --- | ---: |

| 2020 | $6.74T |

| 2021 | $6.56T |

| 2022 | $6.63T |

| 2023 | $7.64T |



The visualization shows:



\- A decline from 2020 to 2021.

\- A modest recovery during 2022.

\- A substantial increase during 2023.



!\[Market Trends Global Reserves](images/market\_trends\_global\_reserves.png)



The reconstructed Tableau workbook is retained as:



`Market Trends Global Reserves.twb`



\---



\## Data Validation \& Analytical Limitations



Reconstructing the project revealed an important limitation in the original

analysis.



The IMF indicator:



\*\*Gold reserves at national valuation\*\*



is expressed in U.S. dollars, but the underlying valuation basis follows

national accounting practices.



This means the values are valid representations of the source data but should

not be interpreted as a standardized comparison of:



\- physical gold holdings, or

\- current market value.



For example, different reporting entities may apply materially different

accounting conventions when valuing official gold reserves.



The reconstruction therefore distinguishes between:



\*\*data accuracy\*\*  

and  

\*\*comparability for a particular analytical question\*\*



This limitation was documented during reconstruction rather than used to

change the scope of the original coursework.



\---



\## Reconstruction Improvements



The portfolio reconstruction intentionally improves presentation and

reproducibility while preserving the original analysis.



Improvements include:



\- Removal of regional and institutional aggregates from the country ranking.

\- Explicit identification of the national-valuation measurement basis.

\- Rebuilt BigQuery SQL with documented analytical steps.

\- Version-controlled SQL artifacts.

\- Cleaned and documented processed datasets.

\- Redesigned Tableau visualizations.

\- Improved titles, labels, units, and visual hierarchy.

\- Preservation of the original Tableau workbooks.

\- Repository-based evidence and documentation suitable for portfolio review.



\---



\## Key Takeaways



This project demonstrates experience with:



\- SQL querying and transformation

\- Google BigQuery

\- Data cleaning and preprocessing

\- Data validation

\- Long/wide data transformation

\- Analytical troubleshooting

\- Measurement-definition validation

\- Tableau visualization

\- Data storytelling

\- Documentation

\- Git / GitHub version control

\- Reconstruction and improvement of legacy analytical work



A key lesson from the reconstruction was that apparently standardized fields

can still contain important methodological differences.



The project therefore reinforced the importance of validating:



\*\*what a measure means, not simply whether the query returns a result.\*\*



\---



\## Repository Structure



```text

imf-reserve-analysis/

├── data/

│   └── processed/

│       ├── global\_reserves\_2020\_2023.csv

│       ├── gold\_reserve\_comparison\_2023.csv

│       ├── IMF\_Dataset\_Cleaned.csv

│       ├── IMF\_Dataset\_Cleaned.xlsx

│       ├── IMF\_Dataset\_Unpivoted\_For\_Tableau.csv

│       └── top\_reserve\_holders\_2023.csv

│

├── docs/

├── evidence/

├── images/

│   ├── market\_trends\_global\_reserves.png

│   └── top\_reserve\_holders\_2023.png

│

├── outputs/

│

├── sql/

│   ├── 01\_reconstruct\_unpivot.sql

│   ├── 02\_gold\_reserves\_2023\_validation.sql

│   ├── 03\_gold\_reserves\_2023\_country\_filter.sql

│   ├── 04\_gold\_reserve\_rankings.sql

│   ├── 05\_gold\_reserves\_volume\_2023.sql

│   ├── 06\_gold\_reserves\_market\_value\_2023.sql

│   ├── 07\_gold\_reserve\_comparison\_2023.sql

│   └── 08\_global\_reserves\_2020\_2023.sql

│

├── Market Trends Global Reserves.twb

├── Top Reserve Holders (2023).twb

├── README.md

└── repository configuration files

