class Track < ActiveRecord::Base
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /.*/

	 belongs_to :user
	 has_many :tracklists
	 has_many :comments
	 has_many :likes
end
