class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_many :favourites, dependent: :destroy
  has_many :favourited_properties, through: :favourites, source: :property
  has_many :reservations, dependent: :destroy
  has_many :payments, through: :reservations
  has_many :reserved_properties, through: :reservations, source: :property
  has_many :reviews, dependent: :destroy
  
  after_create :create_profile

  validates :role, inclusion: { in: Constants::Users::ROLES }, allow_nil: true

  def create_profile
    self.profile = Profile.new
    self.save!
  end

  delegate :full_name, to: :profile

  def host?
    role == "host"
  end

  def customer?
    role.blank?
  end
end
