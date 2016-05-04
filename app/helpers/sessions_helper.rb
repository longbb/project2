module SessionsHelper
  def log_in(member)
    session[:member_id] = member.id
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end

  def logged_in?
    current_member.present?
  end

  def logout
    session.delete :member_id
    @current_member = nil
  end

  def check_logged_in
    if logged_in?
      flash[:danger] = "You already logged in"
      redirect_to root_path
    end
  end
end
