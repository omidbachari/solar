class WattsComprehension
  def location_score(lat, lon)
    wrapper = WattsWrapper.new
    response = wrapper.get(lat, lon)

    if response["errors"].any?
      { errors: response["errors"] }
    else
      {
        score: response["outputs"]["ac_annual"],
        location: response["station_info"]["city"]
      }
    end
  end
end
