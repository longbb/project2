class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      if member.status == "active"
        log_in member
        redirect_to root_path
        flash[:success] = "Login successfully!"
      else
        flash[:danger] = "Your account was blocked!"
        render "new"
      end
    else
      flash[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    if logged_in?
      logout
      redirect_to login_path
      flash[:success] = "Logout successfully!"
    end
  end
end

