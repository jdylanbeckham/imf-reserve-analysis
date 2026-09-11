-- IMF Reserve Analytics
-- Original Coursework Reconstruction
-- Reconstructs the "Global Reserves (2020-23)" visualization
-- by summing annual gold reserves at national valuation.

WITH gold_reserves AS (
  SELECT
    year,
    value
  FROM `imf-reserve-analytics.global_reserves.reserves_cleaned_wide`
  UNPIVOT (
    value FOR year IN (
      `2020`,
      `2021`,
      `2022`,
      `2023`
    )
  )
  WHERE FREQUENCY = 'Annual'
    AND INDICATOR = 'Gold reserves at national valuation'
    AND value IS NOT NULL
)

SELECT
  year,
  SUM(value) AS global_reserve_total_millions_usd
FROM gold_reserves
GROUP BY year
ORDER BY year;