require 'spec_helper'

describe "Events" do
  describe "GET /events" do
    it "display available events" do
      get events_path
      response.status.should be(200)
    end
  end
end


# 1. User = current_user
# 2. Events = Events.all
# 3. Current user events
# 4. Compare current user events and all events
# 5. Display in view 