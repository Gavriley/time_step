class Admin::DashboardController < ApplicationController

  layout 'admin'

  def index
    @page_title = 'Dashboard'
  end

end
