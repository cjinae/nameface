class HomeController < ApplicationController

  def index
  	@samplename = Guess.name_selector
  end

end
