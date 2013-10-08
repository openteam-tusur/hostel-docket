class Ability
  include CanCan::Ability

  def initialize(user)
    return nil unless user

    can :manage, :all if user.administrator?
    can :manage, :statistics if user.manager? || user.reader?

    can :read, Hostel do |hostel|
      user.manager_of?(hostel) || user.reader_of?(hostel)
    end if user.permissions.any?

    can :read, Room do |room|
      can? :read, room.hostel
    end

    can :read, Roomer do |roomer|
      can? :read, roomer.room
    end

    can :manage, Record do |record|
      user.manager_of?(record.roomer.hostel) && can?(:read, record.roomer)
    end

    can :manage, Permission do |permission|
      permission.context_type == 'Roomer' && user.manager_of?(permission.context.hostel)
    end if user.manager?

    can :search, :all if user.manager? || user.reader?
    can :my_stats, :all if user.owner?
  end
end
