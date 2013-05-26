class UsersController < ApplicationController

  before_filter :require_login, :only => :show

  def index
    if params[:cardview].nil?
      @random_users = User.get_random_user(12)
    else
      @random_users = User.get_random_user params[:cardview]
    end

  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new params[:user]
  	if @user.save
  		auto_login(@user)
  		redirect_to user_path(current_user), :notice => 'Account Created'
  	else
  		render :new
  	end
  end

  def show
    @user = User.find params[:id]
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to user_path(current_user), notice: 'You have updated your information'
    else
      render action: "edit"
    end
  end
  
end
