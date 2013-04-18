class Event < ActiveRecord::Base
	attr_accessible :title

	has_many :assignments
	has_many :users, through: :assignments







end