# rubocop:disable Layout/LineLength
# frozen_string_literal: true

require_relative 'country_evaluator'
 
# Country class to store country data.
class Country
  include CountryEvaluator
  
  attr_accessor :name, :population, :gdp, :states, :army_strength, :development_status, :political_stability,
                :international_influence

  def initialize(name, population, gdp, states, army_strength, development_status, political_stability,
                 international_influence)
    @name = name
    @population = population
    @gdp = gdp
    @states = states
    @army_strength = army_strength
    @development_status = development_status
    @political_stability = political_stability
    @international_influence = international_influence
  end

  def to_s
    "Country: #{@name}, Population: #{@population}, GDP: #{@gdp}, States: #{@states}, Army Strength: #{@army_strength}, Development Status: #{@development_status}, Political Stability: #{@political_stability}, International Influence: #{@international_influence}"
  end
end
# rubocop:enable Layout/LineLength