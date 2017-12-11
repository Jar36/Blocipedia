class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
  
  def index?
    user.present?
  end
  
  def show?
    scope.where(:id => wiki.id).exists?
  end
  
  def create?
    user.present?
  end

  def new?
    create?
  end
  
  def edit?
    user.admin? || record.user == user
  end
  
  def destroy?
    user.admin? || record.user == user
  end
  
  
end