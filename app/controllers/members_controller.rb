class MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find_by(id: params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member
      flash[:success] = "Welcome to the forum!"
    else
      render "new"
    end
  end

  private
  	def member_params
    	params.require(:member).permit(:name, :email, :password, :password_confirmation)
  	end
end
