class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  has_many :tagits


end
