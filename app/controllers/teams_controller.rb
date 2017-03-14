class TeamsController < ApplicationController

  load_and_authorize_resource

  def index
    redirect_to root_url unless current_user.manager?

    @team = current_user.team
    @users = @team.users.includes(:records)
  end
  
end
