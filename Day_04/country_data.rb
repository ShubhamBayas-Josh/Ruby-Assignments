# frozen_string_literal: true

#Module to store countries data.
module CountriesData
  COUNTRIES_DATA = [
    {
      country_name: 'United States',
      population: 331_000_000,
      gdp: 21_430_000_000_000, # in USD
      states: 50,
      army_strength: 1_400_000, # active personnel
      development_status: 'developed',
      political_stability: 'stable',
      international_influence: 'high'
    },
    {
      country_name: 'China',
      population: 1_400_000_000,
      gdp: 14_340_000_000_000, # in USD
      states: 23, # provinces
      army_strength: 2_035_000, # active personnel
      development_status: 'developing',
      political_stability: 'stable',
      international_influence: 'high'
    },
    {
      country_name: 'India',
      population: 1_366_000_000,
      gdp: 2_870_000_000_000, # in USD
      states: 28,
      army_strength: 1_444_000, # active personnel
      development_status: 'developing',
      political_stability: 'moderate',
      international_influence: 'moderate'
    },
    {
      country_name: 'Japan',
      population: 126_000_000,
      gdp: 5_080_000_000_000, # in USD
      states: 47, # prefectures
      army_strength: 247_000, # active personnel
      development_status: 'developed',
      political_stability: 'stable',
      international_influence: 'high'
    },
    {
      country_name: 'Germany',
      population: 83_000_000,
      gdp: 3_860_000_000_000, # in USD
      states: 16,
      army_strength: 183_000, # active personnel
      development_status: 'developed',
      political_stability: 'stable',
      international_influence: 'high'
    }
  ].freeze
end