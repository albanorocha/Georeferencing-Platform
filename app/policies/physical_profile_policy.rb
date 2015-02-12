class PhysicalProfilePolicy < ApplicationPolicy
  
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user
  end

  def show?
  	user
  end

  def create?
  	user
  end

  def update?
  	user
  end

  def destroy?
  	user
  end
end