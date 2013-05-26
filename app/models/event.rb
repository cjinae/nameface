class Event < ActiveRecord::Base
	attr_accessible :title, :description, :avatar
    
    has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/owl.png"  
	validates :title, :presence => true, :uniqueness => true
	validates_format_of :title, :with => /^[^`@#\$%\^&*+_=]+$/
  	validates :description, :presence => true

	has_many :assignments
	has_many :users, through: :assignments

end