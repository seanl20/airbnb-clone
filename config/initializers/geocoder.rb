# config/initializers/geocoder.rb
Geocoder.configure(
  http_headers: { 'Accept-Encoding' => 'json' },

  # set default units to kilometers:
  units: :km,
)