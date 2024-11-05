class Reservation < ApplicationRecord
  belongs_to :property
  belongs_to :user

  has_one :payment, dependent: :destroy

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
end
