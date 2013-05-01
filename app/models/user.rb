class User < ActiveRecord::Base
  # authenticates_with_sorcery!
  # attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :cardview, :avatar
  
  has_attached_file :avatar, :styles => {:asd => "250x250px", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"  
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :email, :presence => true, :uniqueness => true
  # validates :password, :presence => true, :on => :create

  has_many :assignments
  has_many :events, through: :assignments
   
  # validates_attachment :avatar, :presence => true,
  # :content_type => { :content_type => "image/jpg" },
  # :size => { :in => 0..10.kilobytes }

	def name
		"#{first_name} #{last_name}"
	end

  def firstname
    "#{first_name}"
  end

  def self.get_random_user(number_of_cards)
    # find(:all).sample(1)
    User.order("random()").first(number_of_cards.to_i)
  end

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret

    end
  end

  def other_user_events
    x = self.events
    Event.where("id NOT IN (?)", x)
  end

end
