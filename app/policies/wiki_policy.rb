class WikiPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end
  
  def edit?
    record.user == user
  end
  
  def destroy?
    user.admin? || record.user == user
  end
  
end