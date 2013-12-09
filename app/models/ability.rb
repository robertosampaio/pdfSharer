class Ability
  include CanCan::Ability
  
  def initialize(user)
    can [:manage], Relatorio, user_id: user.id
  end
end
