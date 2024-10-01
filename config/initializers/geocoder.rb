# config/initializers/geocoder.rb
Geocoder.configure(
  http_headers: { 'Accept-Encoding' => 'json' },

  # set default units to kilometers:
  units: :km,

  lookup: :geoapify, 
  api_key: "dcfa5972aca04beb8067faa21818a0f6",
)