class User < ApplicationRecord
	has_many :topic,dependent: :destroy
	has_many :comments,dependent: :destroy
	has_secure_password

	validates_presence_of :username,:first_name,:last_name,:email

	validates :username,uniqueness:{case_sensitive:false},length:{in:4..12},format:{with:/\A[a-zA-Z][a-zA-Z0-9_-]*\Z/},exclusion:{in:["oturum_ac"]}

	validates :email,email:true,uniqueness:{case_sensitive:false}

	def name
		"#{first_name} #{last_name}"
	end
	def to_param
		username
	end
	def avatar_url(size = 160)
		hash_value = Digest::MD5.hexdigest(email.downcase)
		"http://www.gravatar.com/avatar/#{hash_value}?s=#{size}"
	end
end
