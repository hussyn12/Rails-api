class User < ApplicationRecord
	has_secure_password
	has_many :friends
	has_many :images
	validates :email, presence: true, format: {with: /@/, message: 'is not valid' }
	validates_uniqueness_of :email
	validates :first_name, presence: true

	def self.from_omniauth(auth)
	 	where(:provider => auth['provider'], 
                      :uid => auth['uid']).first_or_create do |user|
	      user.provider = auth['provider']
	      user.uid = auth['uid']
	      if auth['info']
	         user.first_name = auth['info']['first_name'] 
	         user.email = auth['info']['email'] 
	         user.password = auth['uid']
	        end 
	    user.save!   
      end
	end
end
