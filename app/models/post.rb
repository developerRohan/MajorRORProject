class Post < ApplicationRecord
	enum status: { submitted: 0, approved: 1, rejected: 2 }
	belongs_to :user
	validates_presence_of :date , :rationale 

	default_scope {order created_at: :desc}
	# custom scope
	scope :posts_by, ->(user) { where(user_id: user.id) }

end
