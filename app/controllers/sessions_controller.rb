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

  # def destroy
  #   logout
  #   redirect_to :root, notice: "Bye... Hope to see you later!"
  # end

 def create
   user = User.from_omniauth(auth_hash)
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end