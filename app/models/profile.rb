class Profile < ApplicationRecord
  include Countriable
  
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: -> { address.present? && latitude.blank? && longitude.blank?}

  def address
    [address_1, address_2, city, "#{state} #{zip_code}", country_name].compact.join(', ')
  end

  def full_name
    "#{first_name} #{last_name}".squish
  end
end
