class User < ActiveRecord::Base
  authenticates_with_sorcery!
   attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :avatar
   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"  

  has_many :games

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :on => :create

  validates :avatar, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :avatar



	def name
		"#{first_name} #{last_name}"
	end


end
