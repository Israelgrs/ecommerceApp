class AdminPolicy < ApplicationPolicy
  def new?
    user.full_access?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.full_access?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
