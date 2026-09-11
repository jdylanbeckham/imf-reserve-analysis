-- IMF Reserve Analytics
-- 2023 Gold Reserve Measure Comparison
-- Compares rank positions across:
--   1. National valuation
--   2. Physical gold volume
--   3. Market value
--
-- Rankings are calculated independently before joining so that
-- each rank reflects the complete reporting population available
-- for that specific IMF measure.

WITH base AS (
  SELECT
    COUNTRY,
    INDICATOR,
    UNIT,
    SCALE,
    `2023` AS value_2023
  FROM `imf-reserve-analytics.global_reserves.reserves_cleaned_wide`
  WHERE FREQUENCY = 'Annual'
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
),

national_valuation AS (
  SELECT
    COUNTRY,
    value_2023 AS national_valuation_usd_millions,
    RANK() OVER (
      ORDER BY value_2023 DESC
    ) AS national_valuation_rank
  FROM base
  WHERE INDICATOR = 'Gold reserves at national valuation'
    AND UNIT = 'US dollar'
    AND SCALE = 'Millions'
),

physical_volume AS (
  SELECT
    COUNTRY,
    value_2023 AS physical_volume_million_fine_troy_oz,
    RANK() OVER (
      ORDER BY value_2023 DESC
    ) AS physical_volume_rank
  FROM base
  WHERE INDICATOR = 'Gold reserves (volume)'
    AND UNIT = 'Fine troy ounces'
    AND SCALE = 'Millions'
),

market_value AS (
  SELECT
    COUNTRY,
    value_2023 AS market_value_million_sdr,
    RANK() OVER (
      ORDER BY value_2023 DESC
    ) AS market_value_rank
  FROM base
  WHERE INDICATOR = 'Gold reserves at market value'
    AND UNIT = 'SDR'
    AND SCALE = 'Millions'
)

-- Final comparison includes only entities reporting all three measures.
-- Rankings are calculated before joining, so gaps in rank sequences
-- reflect differences in indicator reporting coverage rather than
-- ranking errors.

SELECT
  n.COUNTRY,

  n.national_valuation_usd_millions,
  n.national_valuation_rank,

  p.physical_volume_million_fine_troy_oz,
  p.physical_volume_rank,

  m.market_value_million_sdr,
  m.market_value_rank,

  n.national_valuation_rank - p.physical_volume_rank
    AS national_rank_minus_physical_rank,

  m.market_value_rank - p.physical_volume_rank
    AS market_rank_minus_physical_rank

FROM national_valuation n
JOIN physical_volume p
  USING (COUNTRY)
JOIN market_value m
  USING (COUNTRY)

ORDER BY physical_volume_rank;