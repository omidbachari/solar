require "rails_helper"

describe Score do
  describe "#calculate_score" do
    it "given a lat and lon returns a city and score" do
      VCR.use_cassette "initial vcr" do
        score = Score.new
        location_score = score.calculate_score(42, -71)

        expect(location_score[:location]).to eq "BOSTON"
        expect(location_score[:score]).to eq 785190016.0
      end
    end

    it "returns an error with invalid lat and lon" do
      VCR.use_cassette "initial vcr" do
        score = Score.new
        location_score = score.calculate_score(100, 0)

        expect(location_score).to eq "Your score could not be computed."
      end
    end
  end
end
