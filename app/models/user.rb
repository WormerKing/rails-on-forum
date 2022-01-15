class User < ApplicationRecord
	has_secure_password

	validates_presence_of :username,:first_name,:last_name,:email,:password

	validates :username,uniqueness:{case_sensitive:false},length:{in:4..12},format:{with:/\A[a-zA-Z][a-zA-Z0-9_-]*\Z/}

	validates :email,email:true,uniqueness:{case_sensitive:false}

	validates :password,length:{minimum:6}
end
