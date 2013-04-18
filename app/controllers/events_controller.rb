class EventsController < ApplicationController
before_filter :uniq_title, :only => :add_event_to_user 

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

	def remove_event_from_user
		z = User.find(params[:current_user])
		x = Event.find_by_title(params[:event_title])
       z.events.delete(x)
       redirect_to user_path(z)
	end


  	def add_event_to_user
       z = User.find(params[:current_user])
       	z.events << Event.find_by_title(params[:event_title])
       	redirect_to user_path(z)
       	flash[:notice] =  "#{z.events}"
  	end

protected 

  	def uniq_title
  		z = User.find(params[:current_user])
  		x = z.events
  		if x.any? {|h| h[:title] == params[:event_title]}
  			redirect_to events_path
  			flash[:alert] = "You already added this event"
  		end
  	end

end
