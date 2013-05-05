require 'test_helper'

class EventsControllerTest < ActionController::TestCase
	setup do
		@event = FactoryGirl.create(:event)
	end

	# test "should get index" do
	# 	get :index
	# 	assert_response :success
	# 	assert_not_nil assigns(:events)
	# end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create event" do
		assert_difference('Event.count') do
			post :create, event: { title: @event.title, description: @event.description }
		end

		assert_redirected_to event_path(assigns(:event))
	end


end
