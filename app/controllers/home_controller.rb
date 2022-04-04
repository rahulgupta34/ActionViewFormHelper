class HomeController < ApplicationController
  
  def index
    @simforms = Simform.all
  end

 
  def create

  end

end
