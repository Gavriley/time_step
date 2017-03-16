class HomeController < ApplicationController
  load_and_authorize_resource class: HomeController

  def index
    @page_title = 'Home Page'
  end
  
end
