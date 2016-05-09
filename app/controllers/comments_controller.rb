class CommentsController < ApplicationController
  before_action :must_logged_in, only: [:create]

  def create
    @post = Post.find_by(id: params[:post_id])
    if @post.present?
      if @post.status = "open"
        @comment = Comment.new(
          post_id: params[:post_id],
          content: params[:content],
          member_id: current_member.id
        )
        if @comment.save
          @post.update_attributes(last_comment_at: @comment.created_at, last_comment_id: @comment.id)
          redirect_to @post
          flash[:success] = "Successfully!"
        else
          redirect_to @post
          flash[:danger] = "Something error"
        end
      else
        redirect_to @post
        flash[:danger] = "The topic was closed!"
      end
    else
      redirect_to root_path
      flash[:danger] = "The post doesn't exist"
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
