class User < ActiveRecord::Base
	before_save { self.email.downcase! }

# TODO bessere Email regex
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :name,		presence: true, length: { maximum: 100 }
	validates :alias,		presence: true, length: { maximum: 100 }
	validates :email,		presence: true, length: { maximum: 100 }
	validates :email,		format: { with: VALID_EMAIL_REGEX }
	validates :email,		uniqueness: { case_sensitiv: false }
	validates :role,		presence: true, length: { maximum: 100 }

	has_secure_password
	validates :password, length: { minimum: 6 }
	validates :password, length: { maximum: 100 }
end