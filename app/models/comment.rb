class Comment < ActiveRecord::Base
	belongs_to :anbieter, inverse_of: :comments
	belongs_to :user, inverse_of: :comments

	# has_and_belongs_to_many :users, as: :rated_by_users

	validates :user_id,
		presence: true,
		numericality: { only_integer: true }
	validates :anbieter_id,
		presence: true,
		numericality: { only_integer: true }
	validates :body,
		presence: true,
		length: { maximum: 10000 }
end