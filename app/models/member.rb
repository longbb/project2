class Member < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :avatar
  before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def is_active?
    self.status == "active"
  end

  class << self
    def statistic_member start_date, end_date
      statistic_member = {
        number_member: Array.new,
        date: Array.new
      }
      (start_date..end_date).each do |date|
        number_member = Member.where(
          created_at: date.beginning_of_day..date.end_of_day
        ).count
        statistic_member[:number_member].push number_member
        statistic_member[:date].push date.to_s
      end
      statistic_member
    end
  end
end
