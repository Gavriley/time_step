class TeamsController < ApplicationController
  load_and_authorize_resource

  def index
    @team = current_user.team
    @users = @team.users.includes(:records)
  end
end
