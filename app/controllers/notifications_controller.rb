class NotificationsController < ApplicationController
  before_action :must_logged_in, only: [:index]

  def index
    @posts = current_member.posts
    @notifications = []
    @posts.each do |post|
      post.notifications.each do |notification|
        @notifications.push(notification) if notification.status = "haven't seen"
      end
    end
  end

  private
    def must_logged_in
      unless logged_in?
        redirect_to login_url
        flash[:danger] = "Please login to continue!"
      end
    end
end
