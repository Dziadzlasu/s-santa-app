class WishPolicy < ApplicationPolicy
  def edit?
    user.approved? && record.user_id == user.id
  end
  
  def update?
    edit?
  end
end
