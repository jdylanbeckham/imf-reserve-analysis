-- IMF Reserve Analytics
-- Country/Jurisdiction-Level Filtering
-- Removes IMF economic aggregates, regional groupings,
-- and institutional entities from the reconstructed
-- 2023 gold reserve analysis.

SELECT
  COUNTRY,
  `2023` AS gold_reserves_2023
FROM `imf-reserve-analytics.global_reserves.reserves_cleaned_wide`
WHERE FREQUENCY = 'Annual'
  AND INDICATOR = 'Gold reserves at national valuation'
  AND `2023` IS NOT NULL
  AND COUNTRY NOT IN (
    'Advanced Economies',
    'Advanced, Emerging and Developing Economies',
    'Bank for International Settlements (BIS)',
    'Emerging Market and Developing Economies',
    'Emerging and Developing Asia',
    'Emerging and Developing Europe',
    'Euro Area (EA)',
    'European Central Bank (ECB)',
    'Latin America and the Caribbean (LAC)',
    'Middle East and Central Asia',
    'Sub-Saharan Africa (SSA)',
    'West African Economic and Monetary Union (WAEMU)',
    'World'
  )
ORDER BY gold_reserves_2023 DESC;