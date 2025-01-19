# frozen_string_literal: true

# Module to evaluate the country data.
module CountryEvaluator
  def get_loan
    if @gdp < 1000 && @development_status == "underdeveloped" && @political_stability != "unstable" 
      "Eligible for IMF/World Bank loan" 
    else 
      "Not eligible for IMF/World Bank loan" 
    end
  end

  def seat_in_council 
    if @international_influence == "high" && @political_stability == "Stable" 
      "Eligible for UN Security Council seat" 
    else 
      "Not eligible for UN Security Council seat" 
    end
  end

  def win_war
    if @army_strength > 500000 && @political_stability == "stable" && @gdp > 2000 
      "High chance of winning the war" 
    else 
      "Low chance of winning the war" 
    end 
  end
end