require "rails_helper"

BODY = {
  "inputs" => {
    "lat" => "42",
    "lon" => "-71",
    "system_capacity" => "500000",
    "module_type" => "1",
    "losses" => "0",
    "array_type" => "1",
    "tilt" => "45",
    "azimuth" => "180"
  },
  "errors" => [],
  "warnings" => [],
  "version" => "1.1.0",
  "ssc_info" => {
    "version" => 34,
    "build" => "Unix 64 bit GNU/C++ Aug 18 2014 13:38:36"
  },
  "station_info" => {
    "lat" => 42.36666488647461,
    "lon" => -71.03333282470703,
    "elev" => 5.0,
    "tz" => -5.0,
    "location" => "14739",
    "city" => "BOSTON",
    "state" => "MA",
    "solar_resource_file" => "14739.tm2",
    "distance" => 41097
  },
  "outputs" => {
    "ac_monthly" => [
      52803744.0,
      58672388.0,
      70227000.0,
      69366360.0,
      75493528.0,
      72411088.0,
      77147656.0,
      78098360.0,
      70271424.0,
      68329664.0,
      46420216.0,
      45948544.0
    ],
    "poa_monthly" => [
      105.56478118896484,
      119.45948028564453,
      147.4891357421875,
      146.05984497070312,
      162.46176147460938,
      159.03756713867188,
      170.4688720703125,
      172.92881774902344,
      153.42535400390625,
      145.11585998535156,
      95.10961151123047,
      92.74807739257812
    ],
    "solrad_monthly" => [
      3.405315637588501,
      4.266409873962402,
      4.75771427154541,
      4.868661403656006,
      5.240702152252197,
      5.301252365112305,
      5.498995780944824,
      5.5783491134643555,
      5.114178657531738,
      4.681156635284424,
      3.1703202724456787,
      2.9918735027313232
    ],
    "dc_monthly" => [
      55371760.0,
      62102404.0,
      74905888.0,
      73197968.0,
      79118128.0,
      75795904.0,
      80705048.0,
      81621528.0,
      73463168.0,
      71394168.0,
      48641548.0,
      48124000.0
    ],
    "ac_annual" => 785190016.0,
    "solrad_annual" => 4.572910785675049
  }
}

describe WattsWrapper do
  context "#get", :vcr do
    it "returns an http response with hash" do
      wrapper = WattsWrapper.new
      response = wrapper.get(42, -71)

      expect(response.class.to_s).to eq("Hash")
      expect(response).to eq(BODY)
    end
    it "returns error with invalid lat" do
      wrapper = WattsWrapper.new
      response = wrapper.get(100, 0)

      expect(response["errors"].any?).to be true
    end
    it "returns error with invalid lon" do
      wrapper = WattsWrapper.new
      response = wrapper.get(0, 200)

      expect(response["errors"].any?).to be true
    end
  end
end
