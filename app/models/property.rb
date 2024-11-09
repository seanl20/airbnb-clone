class Property < ApplicationRecord
  include Countriable
  
  has_many_attached :images, dependent: :destroy

  has_many :reviews, as: :reviewable

  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user
  has_many :reservations, dependent: :destroy
  has_many :payments, through: :reservations
  has_many :reserved_users, through: :reservations, source: :user

  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country_code, presence: true

  monetize :price_cents, allow_nil: true

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.blank? && longitude.blank?}

  def address
    # [address_1, address_2, city, state, country].compact.join(', ')
    [state, country_name].compact.join(', ')
  end

  def default_image
    images.first
  end

  def favourited_by?(user:)
    return if user.nil?

    favourited_users.include?(user)
  end

  def available_date
    next_reservation = reservations.future_reservations.first
    return Date.tomorrow.strftime(Constants::Reservations::AVAILABLE_DATE_FORMAT)..Date.today.end_of_year.strftime(Constants::Reservations::AVAILABLE_DATE_FORMAT) unless next_reservation
    next_reservation.checkout_date.strftime(Constants::Reservations::AVAILABLE_DATE_FORMAT)..Date.today.end_of_year.strftime(Constants::Reservations::AVAILABLE_DATE_FORMAT)
  end
end
