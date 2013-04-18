class Event < ActiveRecord::Base
	attr_accessible :title

	has_many :assignments
	has_many :users, through: :assignments


  validates :event_title, :uniqueness => true, :on => :add_event_to_user






end