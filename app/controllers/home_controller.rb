class HomeController < ApplicationController
  load_and_authorize_resource class: HomeController

  def index; end
end
