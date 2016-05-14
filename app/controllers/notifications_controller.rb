class NotificationsController < ApplicationController
  before_action :must_logged_in, only: [:index]

  def index
    @notifications = member_notification
  end

  private
    def must_logged_in
      unless logged_in?
        redirect_to login_url
        flash[:danger] = "Please login to continue!"
      end
    end
end
