class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         devise :omniauthable, :omniauth_providers => [:facebook]

	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :tracks, dependent: :destroy
	has_many :comments, through: :tracks, dependent: :destroy
	has_many :likes, through: :tracks, dependent: :destroy
	has_many :follows, dependent: :destroy
	has_many :followers, through: :follows

	def self.new_with_session(params, session)
	    super.tap do |user|
	      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
	    end
  	end

	def self.from_omniauth(auth)
  		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    		user.email = auth.info.email
    		user.password = Devise.friendly_token[0,20]
  		end
	end

	def tracks_by_people_you_follow
		User.find_by_sql("SELECT tracks.title, tracks.id FROM users LEFT JOIN follows ON users.id = follows.user_id LEFT JOIN tracks ON follows.follow_id = tracks.user_id  WHERE users.id = 3")
	end

end
