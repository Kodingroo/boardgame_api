class GameArchivePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    #only data_admin can update it
    record.user == user
  end

  def create?
    #Any logged in user can create a game_archive
    #Any logged in user who is not disabled
    !user.nil?
  end

  def destroy?
    update?
  end
end
