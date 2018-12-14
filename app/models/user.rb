class User < ApplicationRecord
  attr_writer :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name
  validates :username, presence: true, uniqueness: { case_sensitive: false }, if: :username_required?

  validate :validate_username

  has_many :wishes
  has_many :pairings
  has_one :giver, class_name: 'User'
  has_one :recipient_pairing, -> { where(active: true) }, class_name: 'Pairing', foreign_key: :giver_id
  has_one :recipient, through: :recipient_pairing, class_name: 'User'

  has_one :giver_pairing, -> { where(active: true) }, class_name: 'Pairing', foreign_key: :recipient_id
  has_one :giver, through: :giver_pairing, class_name: 'User'

  before_validation :normalize_login

  def validate_username
    if User.where(email: username).where.not(email: nil).exists?
      errors.add(:username, :invalid)
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def normalize_login
    self.email = nil if email.blank?
    self.username = nil if username.blank?
  end

  def wish_to_fulfill
    wishes.pending.first
  end

  def approved?
    registration_status.eql? 'approved'
  end

  protected

  def email_required?
    username.blank?
  end

  def username_required?
    email.blank?
  end
end
