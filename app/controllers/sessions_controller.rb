class SessionsController < ApplicationController
  def create
    binding.pry
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session[:user_id] = nil
    end
    redirect_to root_path
  end
end
