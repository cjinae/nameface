class EventsController < ApplicationController
	def index
		@events = Event.all
		@current_user = current_user
	end

	def new
		@event = Event.new
	end

	# def create
	# 	@event = Event.new params[:title]
	# 	if @event.save
	# 		redirect_to events_path, :notice => 'Event Created'
	# 	else
	# 		render :new 
	# 	end
	# end

	def edit
	end

	def show  #shows all users of selected event
	    @event = Event.find(params[:id])
	    @eventusers = @event.users.all
	    #json
	    respond_to do |format|
	      format.html {}
	      format.json {render json: @users}
		end
	end

	def destroy
	end

end
