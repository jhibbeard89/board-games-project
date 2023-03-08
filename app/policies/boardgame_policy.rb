class BoardgamePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    record.user == user
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    # user = current_user
    # record = instance of boardgame
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
