class Ability
  include CanCan::Ability

  def initialize(user)
    if user.roles.include?('admin')
      send('admin')
    else
      send('user')
    end
  end

  def admin; end

  def user
    can :manage, :product
    can :manage, :charge
  end
end
