class AdvertiserPolicy < ApplicationPolicy
  
  class Scope < Scope
    def resolve
      scope
    end
  end

  def permitted_attributes
    if user.super_admin?
      [:cnpj, :type, 
      :person_attributes => [:name, :telephone, 
        :user_attributes => [:email, :password, :password_confirmation, :super_admin] ]]
    else
      [:cnpj, 
      :person_attributes => [:name, :telephone, 
        :user_attributes => [:email, :password, :password_confirmation] ]]
    end
  end

  def index?
    user.super_admin?
  end

  def show?
  	(user.person.profile.id == record.id) ||
  	(user.super_admin?)
  end

  def create?
  	user.super_admin?
  end

  def update?
  	(user.person.profile.id == record.id) ||
  	(user.super_admin?)
  end

  def destroy?
  	user.super_admin?
  end
end