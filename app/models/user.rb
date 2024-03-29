class User < ActiveRecord::Base
	before_save { self.email.downcase! }
	before_create :create_remember_token

	has_many :comments, inverse_of: :user
	# has_and_belongs_to_many :comments, as: :comment_ratings

# TODO bessere Email regex
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :name,		presence: true, length: { maximum: 100 }
	validates :nicname,		presence: true, length: { maximum: 100 }
	validates :email,		presence: true, length: { maximum: 100 },
							format: { with: VALID_EMAIL_REGEX },
							uniqueness: { case_sensitiv: false }
	# validates :role,		presence: true, length: { maximum: 100 }

	validates :password, length: { minimum: 6 }
	validates :password, length: { maximum: 100 }

	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt token
		Digest::SHA1.hexdigest token.to_s
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt User.new_remember_token
		end
end