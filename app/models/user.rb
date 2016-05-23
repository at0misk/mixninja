class User < ActiveRecord::Base
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :tracks
	has_many :comments, through: :tracks
	has_many :likes, through: :tracks
	has_many :follows
	has_many :followers, through: :follows

end
