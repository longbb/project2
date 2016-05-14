class MembersController < ApplicationController
  before_action :must_logged_in, only: [:index, :edit, :update, :destroy]
  before_action :not_logged_in, only: [:new, :create]
  before_action :must_be_admin, only: [:index, :destroy]

  def index
    @members = Member.where(role: nil).paginate(page: params[:page])
  end

  def show
    @member = Member.find_by(id: params[:id])
    if @member.present?
      @number_posts = @member.posts.length
      @number_comments = @member.comments.length
    else
      redirect_to root_path
      flash[:danger] = "Member doesn't exist!"
    end
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
    if @member.present?
      unless current_member.id == @member.id
        redirect_to root_path
        flash[:danger] = "Permission denied!"
      end
    else
      redirect_to root_path
      flash[:danger] = "Member doesn't exist!"
    end
  end

  def update
    @member = Member.find_by(id: params[:id])
    if @member.present?
       if params[:member].present?
        if current_member.id == @member.id
          if @member.update_attributes(member_params)
            redirect_to @member
            flash[:success] = "Update profile successfully!"
          else
            render "edit"
          end
        else
          redirect_to root_path
          flash[:danger] = "Permission denied!"
        end
      else
        if current_member.role == "admin"
          @member.update_attribute(:role, "admin")
          redirect_to members_path
          flash[:success] = "Success!"
        else
          redirect_to root_path
          flash[:danger] = "Permission denied!"
        end
      end
    else
      redirect_to root_path
      flash[:danger] = "Member doesn't exist!"
    end
  end

  def destroy
    @member = Member.find_by(id: params[:id])
    if @member.present?
      if @member.is_active?
        @member.update_attribute(:status, "deleted")
      else
        @member.update_attribute(:status, "active")
      end
      redirect_to members_path
      flash[:success] = "Success!"
    else
      redirect_to root_path
      flash[:danger] = "Member doesn't exist!"
    end
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

    def must_be_admin
      if logged_in?
        unless current_member.role == "admin"
          redirect_to root_path
          flash[:danger] = "Permission denied!"
        end
      end
    end
end
