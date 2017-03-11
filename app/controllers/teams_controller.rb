class TeamsController < ApplicationController

  def index
    redirect_to root_path if !current_user.manager?

    @team = current_user.team
    @users = @team.users.includes(:records)
  end

end
