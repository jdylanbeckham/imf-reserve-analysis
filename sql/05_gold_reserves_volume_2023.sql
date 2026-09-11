-- IMF Reserve Analytics
-- 2023 Gold Reserve Physical Holdings
-- Ranks country/jurisdiction-level reporting entities
-- by physical gold reserves in millions of fine troy ounces.
--
-- Unlike "Gold reserves at national valuation," this measure
-- uses a common physical unit and is directly comparable
-- across reporting entities.

SELECT
  COUNTRY,
  `2023` AS gold_reserves_million_fine_troy_oz
FROM `imf-reserve-analytics.global_reserves.reserves_cleaned_wide`
WHERE FREQUENCY = 'Annual'
  AND INDICATOR = 'Gold reserves (volume)'
  AND UNIT = 'Fine troy ounces'
  AND SCALE = 'Millions'
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
    'International Monetary Fund (IMF)',
    'Latin America and the Caribbean (LAC)',
    'Middle East and Central Asia',
    'Sub-Saharan Africa (SSA)',
    'West African Economic and Monetary Union (WAEMU)',
    'World'
  )
ORDER BY gold_reserves_million_fine_troy_oz DESC
LIMIT 10;