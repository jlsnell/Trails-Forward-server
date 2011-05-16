class Ability
  include CanCan::Ability

  def initialize(user)
    can :access_private_data, Player, :user_id => user.id
    can :access_private_data, User, :id => user.id
    
    can :create_player, User, :id => user.id
    can :update_player, Player, :user_id => user.id
    
    can :index_user_players, :all
    can :show_player, :all
    
    #users can only do things in worlds they inhabit
    can :do_things, World do |world|
      world.player_for_user(user)
    end
    
    can :bid, Megatile do |megatile|
      #the user doesn't already own the tile
      (can? :do_things, megatile.world) and ( megatile.owner != megatile.world.player_for_user(user) )
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
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
