class WikiPolicy < ApplicationPolicy
  # def destroy?
  #  user.admin?
  # end
  
  def edit?
    user.admin? || record.user == user
  end
  
  def destroy?
    user.admin? || record.user == user
  end
  
  def private_wiki?
  end
  
end