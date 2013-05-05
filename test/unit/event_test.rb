require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

setup do 
	@e = FactoryGirl.create(:event)
	assert @e.valid?
end

test "must refue if no title" do
	@e.title = ""
	refute @e.valid?
end

test "must refute if no description" do 
	@e.description = ""
	refute @e.valid?
end

test "must refute if invalid title" do
	@e.title = "Wrong$ &title"
	refute @e.valid?
end



end
