class Track < ActiveRecord::Base
  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /.*/
  # validates_attachment_content_type :avatar, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

  # validates_attachment_content_type :avatar, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }
  	# do_not_validate_attachment_file_type :avatar
	 belongs_to :user
	 has_many :tracklists
	 has_many :comments
	 has_many :likes
	 
end
