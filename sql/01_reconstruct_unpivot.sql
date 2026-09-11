-- IMF Reserve Analytics
-- Original Coursework Reconstruction
-- Reconstructs the 2020–2023 annual UNPIVOT demonstrated
-- in the original 2025 ADTA 4240 BigQuery workflow.

SELECT
  COUNTRY,
  INDICATOR,
  UNIT,
  FREQUENCY,
  SCALE,
  year,
  value
FROM `imf-reserve-analytics.global_reserves.reserves_cleaned_wide`
UNPIVOT (
  value FOR year IN (
    `2020` AS '2020',
    `2021` AS '2021',
    `2022` AS '2022',
    `2023` AS '2023'
  )
)
WHERE value IS NOT NULL;