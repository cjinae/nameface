class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :avatar
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/owl.png"  
  validates_format_of :first_name, :with => /^[^0-9`!@#\$%\^&*+_=]+$/
  validates_format_of :last_name, :with => /^[^0-9`!@#\$%\^&*+_=]+$/
  
  # for non-linked in user 
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :on => :create

  has_many :assignments
  has_many :events, through: :assignments

	def name
		"#{first_name} #{last_name}"
	end

  def firstname
    "#{first_name}"
  end

  def available_events
    x = self.events
    if x.present?
      Event.where("id NOT IN (?)", x)
    else
      Event.all
    end
  end

  def self.get_random_user(number_of_cards)
    # find(:all).sample(1)
    User.order("random()").first(number_of_cards.to_i)
  end

end
