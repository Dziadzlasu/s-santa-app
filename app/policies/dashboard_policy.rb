class DashboardPolicy < ApplicationPolicy
  def index?
    user.approved?
  end
end
