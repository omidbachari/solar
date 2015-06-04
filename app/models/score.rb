class Score < ActiveRecord::Base
  def calculate_score(lat, lon)
    location = WattsComprehension.new
    location.location_score(lat, lon)
  end
end
