class OutdoorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def index?
    user
  end
  
  def create?
  	user.super_admin? || user.media_company?
  end

  def update?
  	(user.person.profile.id == record.media_company.id) ||
  	(user.super_admin?)
  end

  def destroy?
  	(user.person.profile.id == record.media_company.id) ||
  	(user.super_admin?)
  end
end
