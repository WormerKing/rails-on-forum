class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :forum

  has_many :comments,dependent: :destroy

  validates_presence_of :title,:body,:user,:forum

  validates :body,length:{minimum:20}

  default_scope {order(created_at: :desc)}
end
