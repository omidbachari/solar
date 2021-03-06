require "rails_helper"

describe WattsComprehension do
  context "#location_score", :vcr do
    it "returns hash of location name and score" do
      place = WattsComprehension.new
      location_score = place.location_score(42, -71)

      expect(location_score[:location]).to eq "BOSTON"
      expect(location_score[:score]).to eq 785190016.0
    end
    it "returns an error if latitude invalid" do
      place = WattsComprehension.new
      score = place.location_score(100, 0)

      expect(score[:errors].count).to eq 1
      expect(score[:errors].first).to eq "'lat' must be between -90 and 90"
    end
    it "returns an error if longitude invalid" do
      place = WattsComprehension.new
      score = place.location_score(0, 200)

      expect(score[:errors].count).to eq 1
      expect(score[:errors].first).to eq "'lon' must be between -180 and 180"
    end
    it "returns an error if location invalid" do
      place = WattsComprehension.new
      score = place.location_score(100, 200)

      expect(score[:errors].count).to eq 2
    end
  end
end
