class Forum < ApplicationRecord
	has_many :topic,dependent: :destroy
	has_many :comments,through: :topic
	validates :name,presence:true,uniqueness: true
end
