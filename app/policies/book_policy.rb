class BookPolicy < ApplicationPolicy
  def update?
    is_owner?
  end

  def edit?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  def show?
    return true if record.publish?

    is_owner? || !record.draft?
  end

  def publish?
    is_owner? && record.draft?
  end

  def draft?
    is_owner? && record.publish?
  end

  private
  ##############################################################################

  def is_owner?
    user.is_a?(AdminUser) || record.user == user
  end
end
