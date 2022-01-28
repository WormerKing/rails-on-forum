class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :forum

  validates_presence_of :title,:body,:user,:forum

  validates :body,length:{minimum:20}
end
