class WattsWrapper
  def get(lat, lon)
    JSON.parse(http.get(api_url, parameters(lat, lon)).body)
  end

  private

  def parameters(lat, lon)
    { api_key: api_key,
      lat: lat,
      lon: lon,
      system_capacity: 500000,
      module_type: 1,
      losses: 0,
      array_type: 1,
      tilt: 45,
      azimuth: 180
    }
  end

  def http
    @_http ||= HTTPClient.new
  end

  def api_url
    "https://developer.nrel.gov/api/pvwatts/v5.json"
  end

  def api_key
    ENV["WATTS_KEY"]
  end
end
