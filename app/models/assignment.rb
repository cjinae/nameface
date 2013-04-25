class Assignment < ActiveRecord::Base
	attr_accessible :event

	belongs_to :user
	belongs_to :event

	validates_uniqueness_of :event_id, :scope => :user_id

end