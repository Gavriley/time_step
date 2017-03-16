class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    if @user.new_record?
      guest_ability
    elsif @user.user?
      user_ability
    elsif @user.manager?
      manager_ability
    elsif @user.admin?
      admin_ability
    end
  end

  private

  def admin_ability
    can :manage, :all
  end

  def manager_ability
    user_ability

    can :read, Team
  end

  def user_ability
    guest_ability

    can :read, Record
    can :create, Record
    can :update, Record, user: @user
  end

  def guest_ability
    can :read, HomeController
  end

end
