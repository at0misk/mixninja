class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         devise :omniauthable, :omniauth_providers => [:facebook]

	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :tracks
	has_many :comments, through: :tracks
	has_many :likes, through: :tracks
	has_many :follows
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
    		# user.name = auth.info.name   # assuming the user model has a name
    		# user.image = auth.info.image # assuming the user model has an image
  		end
	end

end
