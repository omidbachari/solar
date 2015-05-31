require "rails_helper"

describe WattsWrapper do
  context "#get" do
    it "returns an http response" do
      VCR.use_cassette "initial vcr", record: :new_episodes do
        wrapper = WattsWrapper.new
        response = wrapper.get(42, -71)

        puts response
        expect(response).to be_truthy

      end
    end
  end

end
