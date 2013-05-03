class EventsController < ApplicationController
# before_filter :require_login, :only => :uniq_title
# before_filter :uniq_title, :only => :add_event_to_user
	# include EventsHelper
	
	def index
		@events = current_user.available_events
		@current_user = current_user
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			redirect_to events_path, :notice => 'Event Created'
		else
			render :new 
		end
	end

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
		x = Event.find_by_title(params[:event_title])
       current_user.events.delete(x)
       redirect_to user_path(current_user)
	end

  	def add_event_to_user
     	x = Event.find_by_title(params[:event_title])
     	assignment = current_user.assignments.build( :event => x )
	   	if assignment.save
		   	# redirect_to user_path(current_user)
		    flash[:notice] =  params[:event_title]
		else
		    flash[:alert] =  "You already added this event"
		end
	   	redirect_to events_path
  	end

# protected 

#   	def uniq_title
#   		z = User.find(params[:current_user])
#   		x = z.events
#   		if x.any? {|h| h[:title] == params[:event_title]}
#   			redirect_to events_path
#   			flash[:alert] = "You already added this event"
#   		end
#   	end

end
