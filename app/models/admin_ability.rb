class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.roles.include?('admin')
      send('admin')
    else
      send('user')
    end
  end

  def admin
    can :manage, :category
    can :manage, :sub_category
  end

  def user; end
end
