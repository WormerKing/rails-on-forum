class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates_presence_of :body,:user,:topic
end
