class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @posts = @topic.posts.order(last_comment_at: :desc).paginate(page: params[:page])
  end
end
