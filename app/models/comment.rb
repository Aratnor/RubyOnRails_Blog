class Comment < ApplicationRecord
	belongs_to :article,optional: true
	belongs_to :user,optional: true
	validates :comment,presence: true,length: {minimum:1,maximum:500}
	validates :user_id,presence: true
	validates :article_id,presence: true
end