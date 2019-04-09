# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize user
    can :read, [Product, Comment]
    return if user.blank?
    can :manage, Comment, user_id: user.id
    if user.admin?
      can :manage, :all
      cannot :update, Comment do |comment|
        comment.user_id != user.id
      end
    elsif user.normal_user?
      can [:create, :read, :destroy], Order, user_id: user.id
      can :create, Suggestion
      can :read, Product
      can :read, User, id: user.id
    end
  end
end
