class Ability
  include CanCan::Ability

  def initialize(user)
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    if user.user_type == 'Administrator'
        can :manage, :all
    elsif user.user_type == 'Client'
        can :read, Order, client_id: user.client.id
        can :read, BillOfLading, :order => { :client_id => user.client.id }
        can :read, Certificate, :order => { :client_id => user.client.id }
        can :read, Phytosanitary, :order => { :client_id => user.client.id }
        can :read, Container, :order => { :client_id => user.client.id }
    elsif user.user_type == 'Consignee'
        can :read, Order, consignee_id: user.consignee.id
        can :read, BillOfLading, :order => { :consignee_id => user.consignee.id }
        can :read, Certificate, :order => { :consignee_id => user.consignee.id }
        can :read, Phytosanitary, :order => { :consignee_id => user.consignee.id }
        can :read, Container, :order => { :consignee_id => user.consignee.id }
    elsif user.user_type == 'Notify'
        can :read, Order, notification_id: user.consignee.id
        can :read, BillOfLading, :order => { :notification_id => user.notification.id }
        can :read, Certificate, :order => { :notification_id => user.notification.id }
        can :read, Phytosanitary, :order => { :notification_id => user.notification.id }
        can :read, Container, :order => { :notification_id => user.notification.id }
    else
        cannot :manage, :all
    end
  end
end
