# frozen_string_literal: true
require 'io/console'
require_relative 'country_data.rb'
require_relative 'country_class.rb'

# CLIApplication class to manage the CLI application.
class CLIApplication # rubocop:disable Metrics/ClassLength
  include CountriesData

  def initialize
    @countries = COUNTRIES_DATA.map do |country_data|
      Country.new(
        country_data[:country_name],
        country_data[:population],
        country_data[:gdp],
        country_data[:states],
        country_data[:army_strength],
        country_data[:development_status],
        country_data[:political_stability],
        country_data[:international_influence]
      )
    end
  end

  def main
    loop do
      system('clear')
      display_menu
      print 'Choose an option:'

      choice = $stdin.getch.to_i
      print choice

      case choice
      when 1
        add_country
      when 2
        puts
        print 'Listing countries...'
        puts
        puts list_countries
        puts 'Press any key to continue...'
        $stdin.getch        
      when 3
        puts
        @countries.each_with_index { |country, index| puts "#{index + 1}. #{country.name}" }
        print "Choose a country to evaluate:"
        country_index = gets.chomp.to_i - 1
        raise 'Invalid country index.' if country_index.negative? || country_index >= @countries.size
        p "\nEvaluate..."
        p "\n #{@countries[country_index].get_loan}"
        p "\n #{@countries[country_index].seat_in_council}"
        p "\n #{@countries[country_index].win_war}"
        $stdin.getch
      when 4
        puts "\n Exiting..."
        sleep(1)
        break
      else
        puts "\n Invalid choice. Please try again."
        sleep(2)
        raise
      end
    end
  rescue StandardError
    retry
  end

  private

  def display_menu
    p "=== CLI Application ==="
    p "1. Add Country"
    p "2. List"
    p "3. Evaluate"
    p "4. Exit"
  end

  def list_countries
    @countries.each { |country| puts country.to_s }
  end

  def add_country
    puts
    p 'Enter country name:'
    name = gets.chomp

    puts
    p 'Enter population:'
    population = gets.chomp.to_i

    puts
    p 'Enter GDP:'
    gdp = gets.chomp.to_i

    puts
    p 'Enter number of states:'
    states = gets.chomp.to_i

    puts
    p 'Enter army strength:'
    army_strength = gets.chomp.to_i

    puts
    p 'Enter development status:'
    development_status = gets.chomp

    puts
    p 'Enter political stability:'
    political_stability = gets.chomp

    puts
    p 'Enter international influence:'
    international_influence = gets.chomp

    @countries << Country.new(
      name, population, gdp, states, army_strength, development_status, political_stability, international_influence
    )

    puts
    p 'Country added successfully.'
  end
end

# Running the CLI application.
CLIApplication.new.main