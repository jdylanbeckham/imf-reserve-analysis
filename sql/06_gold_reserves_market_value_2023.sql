-- IMF Reserve Analytics
-- 2023 Gold Reserves at Market Value
-- Ranks country/jurisdiction-level reporting entities
-- by IMF-reported market value of gold reserves.
--
-- Values are reported in millions of SDRs.
-- This provides a standardized market-value comparison
-- alongside national valuation and physical gold volume.

SELECT
  COUNTRY,
  `2023` AS gold_reserves_market_value_million_sdr
FROM `imf-reserve-analytics.global_reserves.reserves_cleaned_wide`
WHERE FREQUENCY = 'Annual'
  AND INDICATOR = 'Gold reserves at market value'
  AND UNIT = 'SDR'
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
ORDER BY gold_reserves_market_value_million_sdr DESC
LIMIT 10;