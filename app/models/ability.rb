class Ability
  include CanCan::Ability

  def initialize(user)
    return nil unless user

    can :manage, :all if user.administrator?
    can :manage, :statistics if user.manager?

    can :read, Hostel do |hostel|
      user.manager_of?(hostel)
    end

    can :read, Room do |room|
      can? :read, room.hostel
    end

    can :read, Roomer do |roomer|
      can? :read, roomer.room
    end

    can :manage, Record do |record|
      can? :read, record.roomer
    end

    can :search, :all if user.manager?
  end
end
