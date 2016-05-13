class MembersController < ApplicationController
  before_action :must_logged_in, only: [:index, :edit, :update, :destroy]
  before_action :not_logged_in, only: [:new, :create]

  def index
  end

  def show
    @member = Member.find_by(id: params[:id])
    @number_posts = @member.posts.length
    @number_comments = @member.comments.length
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.status = "active"
    if @member.save
      redirect_to login_path
      flash[:success] = "Welcome to the forum!"
    else
      render "new"
    end
  end

  def edit
    @member = Member.find_by(id: params[:id])
  end

  def update
    @member = Member.find_by(id: params[:id])
    if @member.update_attributes(member_params)
      redirect_to @member
      flash[:success] = "Update profile susscessfully!"
    else
      render "edit"
    end
  end

  def destroy
  end

  private
    def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def must_logged_in
      unless logged_in?
        redirect_to login_url
        flash[:danger] = "Please login to continue!"
      end
    end

    def not_logged_in
      if logged_in?
        redirect_to current_member
        flash[:danger] = "You already logged in"
      end
    end
end
