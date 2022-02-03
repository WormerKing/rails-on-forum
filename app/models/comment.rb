class Comment < ApplicationRecord
  belongs_to :topic,:counter_cache => :comments_count
  belongs_to :user

  validates_presence_of :body,:user,:topic
end
