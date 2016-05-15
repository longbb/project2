class Post < ActiveRecord::Base
  belongs_to :member
  belongs_to :topic
  has_many :comments
  has_many :notifications
  validates :title,  presence: true
  validates :content,  presence: true
  validates :member_id,  presence: true
  validates :topic_id,  presence: true

  class << self
    def statistic_post start_date, end_date
      statistic_post = {
        number_post: Array.new,
        date: Array.new
      }
      (start_date..end_date).each do |date|
        number_post = Post.where(
          created_at: date.beginning_of_day..date.end_of_day
        ).count
        statistic_post[:number_post].push number_post
        statistic_post[:date].push date.to_s
      end
      statistic_post
    end
  end
end
