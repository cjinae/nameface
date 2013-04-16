class UsersController < ApplicationController
  
  def index
    @random_user = User.get_random_user
    # @samplename = Guess.name_selector.name
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
    # respond_to do |format|
    #   format.html do
    #     format.json {render json: @user}
    #   end
    # end
  end




end
