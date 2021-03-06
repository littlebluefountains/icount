class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user (not logged in)
    # if user.has_role? nil
    #     can :manage, :all
    # end
    if user.has_role? :super_admin
        can :manage, :all
    end
    if user.has_role? :admin
        can :manage, :all
        cannot :manage, Account
    end
    if user.has_role? :manager
        can :manage, :all
        cannot :manage, [Account, User]
    end
    if user.has_role? :sales
        can [:read, :update], SalesMeterReading, Waybill
        can [:read, :update], User do |account|
            account.username == user.username
            #account.email == user.email
        end
    end
    if user.has_role? :user
        can [:read, :update], User do |account|
            account.username == user.username
            #account.email == user.email
        end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
