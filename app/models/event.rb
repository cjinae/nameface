class Event < ActiveRecord::Base
	attr_accessible :title, :description, :avatar
    
    has_attached_file :avatar, :styles => { :asd => "250x250px", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"  
	validates :title, :presence => true, :uniqueness => true
  	validates :description, :presence => true

	has_many :assignments
	has_many :users, through: :assignments



end