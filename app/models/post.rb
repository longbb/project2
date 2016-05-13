class Post < ActiveRecord::Base
  belongs_to :member
  belongs_to :topic
  has_many :comments
  has_many :notifications
  validates :title,  presence: true
  validates :content,  presence: true
  validates :member_id,  presence: true
  validates :topic_id,  presence: true
end
