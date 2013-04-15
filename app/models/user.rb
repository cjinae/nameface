class User < ActiveRecord::Base
  authenticates_with_sorcery!
   attr_accessible :email, :password, :password_confirmation, :first_name, :last_name
  has_many :games

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :on => :create

	def name
		"#{first_name} #{last_name}"
	end


end
