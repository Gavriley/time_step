# top-level class documentation comment
class TeamsController < ApplicationController
  def index
    redirect_to root_url unless current_user.manager?

    @team = current_user.team
    @users = @team.users.includes(:records)
  end
end
