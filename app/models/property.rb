class Property < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true

  monetize :price_cents, allow_nil: true

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.blank? && longitude.blank?}

  has_many_attached :images

  has_many :reviews, as: :reviewable

  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user

  def address
    # [address_1, address_2, city, state, country].compact.join(', ')
    [state, country].compact.join(', ')
  end

  def default_image
    images.first
  end

  def favourited_by?(user:)
    return if user.nil?

    favourited_users.include?(user)
  end
end
