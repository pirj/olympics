class Ability
  include CanCan::Ability

  def initialize(user)
    self.send(user.role)
  end

protected
  # TODO: refactor to classes with canard gem
  def sys_admin
    can :manage, :all
  end

  def ko_user
  end

  def ko_admin
  end

  def knvsh_admin
  end

  def knvsh_user
  end

  def tso_admin
  end

  def tso_user
  end

  def external_user
    can :read, :all
  end

  def none
    can :read, :News
  end
end
