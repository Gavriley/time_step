class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    if @user.new_record?

    elsif @user.user?
      user_ability
    elsif @user.manager?
      manager_ability
    elsif @user.admin?
      admin_ability
    end
  end

  private

  def user_ability
    can :read, Record
    can :create, Record
    can :update, Record, user: @user
  end

  def manager_ability
    can :read, Record
    can :create, Record
    can :update, Record, user: @user

    can :read, Team
  end

  def admin_ability
    can :manage, :all
  end
end
