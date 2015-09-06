class Ability
  include CanCan::Ability

  def initialize(user)

    # TODO: refactor to classes/methods
    if user.role.sys_admin?
      can :manage, :all
    elsif user.role.ko_admin?
    elsif user.role.ko_user?
    elsif user.role.knvsh_admin?
    elsif user.role.knvsh_user?
    elsif user.role.tso_admin?
    elsif user.role.tso_user?
    elsif user.role.external_user?
      can :read, :all
    else

    end
  end
end
