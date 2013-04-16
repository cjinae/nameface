class User < ActiveRecord::Base
  authenticates_with_sorcery!
   attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :avatar
   attr_accessible :avatar
   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"  

  has_many :games

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :on => :create

  # validates_attachment :avatar, :presence => true,
  # :content_type => { :content_type => "image/jpg" },
  # :size => { :in => 0..10.kilobytes }

  
	def name
		"#{first_name} #{last_name}"
	end

  def self.get_random_user #number_of_users
    # find(:all).sample(1)
    User.order("random()").first(4)   #(number_of_users)
  end




end
