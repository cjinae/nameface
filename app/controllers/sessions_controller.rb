class SessionsController < ApplicationController

# For the Linked-In API VERSION
  def create
    # raise env["omniauth.auth"].to_yaml
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to user_path(current_user), notice: "Signed in."
  end
 
  def destroy
    logout
    redirect_to :root, notice: "Bye... Hope to see you later!"
  end


end