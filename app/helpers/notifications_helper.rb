module NotificationsHelper
  def member_notification
    @posts = current_member.posts
    @notifications = []
    @posts.each do |post|
      post.notifications.each do |notification|
        @notifications.push(notification) if notification.status == "haven't seen"
      end
    end
    if @notifications.empty?
      current_member.update_attribute(:notification, "no")
    end
    return @notifications
  end
end
