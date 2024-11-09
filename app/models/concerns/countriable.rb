module Countriable
  def country_name
    country = ISO3166::Country[country_code]
    
    return nil unless country

    country.translations[I18n.locale.to_s] || country.name
  end
end