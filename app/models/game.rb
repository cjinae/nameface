class Game < ActiveRecord::Base
  attr_accessible :file, :first_name, :trigger

  belongs_to :user


end
