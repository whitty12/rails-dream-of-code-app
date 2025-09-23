class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  def require_admin
    if session[:role] != 'admin'
      redirect_to root_path
      flash[:alert] = 'You do not have access to that page'
    end
  end

  def require_student
    if session[:role] != 'student'
      redirect_to root_path
    end
  end

  def require_mentor
    if session[:role] != 'mentor'
      redirect_to root_path
    end
  end
end
