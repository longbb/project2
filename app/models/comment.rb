class Comment < ActiveRecord::Base
  belongs_to :member
  belongs_to :post

  class << self
    def statistic_comment start_date, end_date
      statistic_comment = {
        number_comment: Array.new,
        date: Array.new
      }
      (start_date..end_date).each do |date|
        number_comment = Comment.where(
          created_at: date.beginning_of_day..date.end_of_day
        ).count
        statistic_comment[:number_comment].push number_comment
        statistic_comment[:date].push date.to_s
      end
      statistic_comment
    end
  end
end
