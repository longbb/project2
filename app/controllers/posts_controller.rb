class PostsController < ApplicationController
  def index
    if(params[:member_id].present?)
      @member = Member.find_by(id: params[:member_id])
      if @member.present?
        @posts = @member.posts.paginate(page: params[:page])
      end
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.present?
      @comments = @post.comments.paginate(page: params [:page])
    else
      redirect_to root_path
      flash[:danger] = "The post doesn't exist"
    end
  end

  def new
    if logged_in?
      @post = Post.new
      @topics = Topic.all
    else
      redirect_to login_url
      flash[:danger] = "Please login to continue!"
    end
  end

  def create
    if logged_in?
      @post = Post.new(post_params)
      @post.member_id = current_member.id
      if @post.save
        redirect_to post_path(@post.id)
        flash[:success] = "Success"
      else
        render "new"
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:topic_id, :title, :content)
    end
end
