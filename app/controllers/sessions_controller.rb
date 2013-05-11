class SessionsController < ApplicationController
  # def new 
  # end

  # def create
  #   @user = login(params[:email], params[:password])
  #   if @user
  #     redirect_to user_path(@user), :notice => "Welcome back"
  #   else
  #     flash.now[:alert] = "Invalid credentials. Try again?"
  #     render :new
  #   end
  # end

# For the Linked-In API VERSION
  def create
    # raise env["omniauth.auth"].to_yaml
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to user_path(current_user), notice: "Signed in."
  end
 
  # def destroy
  #   logout
  #   redirect_to :root, notice: "Bye... Hope to see you later!"
  # end


# def create
#   user = User.from_omniauth(env["omniauth.auth"])
#   session[:user_id] = user.id
#   redirect_to user_path(current_user), notice: "Signed in!"
# end

# def destroy
#   session[:user_id] = nil
#   redirect_to root_url, notice: "Signed out!"
# end

end