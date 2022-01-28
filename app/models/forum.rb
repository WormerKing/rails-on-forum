class Forum < ApplicationRecord
	has_many :topic,dependent: :destroy
	validates :name,presence:true,uniqueness: true
end
