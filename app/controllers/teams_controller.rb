class TeamsController < ApplicationController
  load_and_authorize_resource

  def index
    @team = current_user.team
    @page_title = "#{@team.name}'s Page"
    @users = @team.users.includes(:records)
  end
end
