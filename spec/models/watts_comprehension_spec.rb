require "rails_helper"

describe WattsComprehension do
  context "#location_score" do
    it "returns hash of location name and score" do
      VCR.use_cassette "initial vcr" do
        place = WattsComprehension.new
        location_score = place.location_score(42, -71)

        expect(location_score[:location]).to eq "BOSTON"
        expect(location_score[:score]).to eq 785190016.0
      end
    end
    it "returns an error if location invalid" do
      VCR.use_cassette "initial vcr" do
        place = WattsComprehension.new
        score = place.location_score(100, 0)

        expect(score).to eq "Your score could not be computed."
      end
    end
  end
end
