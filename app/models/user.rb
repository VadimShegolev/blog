class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'user_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [ :login ]

  attr_writer :login

  def login
    @login || self.phone || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(phone) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:phone].nil?
        where(conditions).first
      else
        where(phone: conditions[:phone]).first
      end
    end
  end

  validates_format_of :phone, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # validate :validate_phone

  # def validate_phone
  #   if User.where(phone: phone).exists?
  #     errors.add(:phone, :invalid)
  #   end
  # end

  # validate :validate_email

  # def validate_email
  #   if User.where(email: email).exists?
  #     errors.add(:email, :invalid)
  #   end
  # end
end
