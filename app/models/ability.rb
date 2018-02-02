class Ability
  include CanCan::Ability

  def initialize(user)
    if user.roles.include?('admin')
      send('admin')
    else
      send('user')
    end
  end

  def admin
    can :manage, Category    
  end

  def user
    can :manage, Product      
  end
end
