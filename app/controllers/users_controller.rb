class UsersController < ApplicationController

  before_filter :require_login, :only => :show

  def index
    if params[:cardview].nil?
      @random_users = User.get_random_user(12)
    else
      @random_users = User.get_random_user params[:cardview]
    end
    # @users = User.all
    # respond_to do |format|
    #   format.html {}
      # format.json {render json: @users.to_json(only: :first_name)}
      # format.json {render json: @users}
    # end
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

  def check_uniq
  
  end

# if current_user.events includes? :event_title  don't add event to user



end
