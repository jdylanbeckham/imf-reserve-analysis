-- IMF Reserve Analytics
-- Original Coursework Reconstruction
-- Reconstructs the 2023 "Top Reserve Holders" analysis
-- from the original 2025 ADTA 4240 project.

SELECT
  COUNTRY,
  `2023` AS gold_reserves_2023
FROM `imf-reserve-analytics.global_reserves.reserves_cleaned_wide`
WHERE FREQUENCY = 'Annual'
  AND INDICATOR = 'Gold reserves at national valuation'
  AND `2023` IS NOT NULL
ORDER BY gold_reserves_2023 DESC;