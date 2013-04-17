class UsersController < ApplicationController
  
  def index
    if params[:cardview].nil?
      @random_users = User.get_random_user(3)
    else
      @random_users = User.get_random_user params[:cardview] #DON'T KNOW HOW TO PASS FROM INDEX DROPDOWN
    end
    @users = User.all
    respond_to do |format|
      format.html {}
      # format.json {render json: @users.to_json(only: :first_name)}
      format.json {render json: @users}
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new params[:user]
  	if @user.save
  		auto_login(@user)
  		redirect_to root_path, :notice => 'Account Created'
  	else
  		render :new
  	end
  end

  def show
    @user = User.find params[:id]
  end

end
