Geocoder.configure(
  # Geocoding options
  # lookup: :nominatim,
  # api_key: ENV['GOOGLE_MAPS_API_KEY'], # Make sure this is set correctly
  timeout: 5, # seconds
  units: :km, # defaults to :mi
  http_headers: { 'User-Agent' => 'hisis' },
  always_raise: :all
)