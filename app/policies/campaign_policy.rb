class CampaignPolicy < BasePolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.business == user.business
  end

  def destroy?
    record.business == user.business
  end
end
