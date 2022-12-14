class EventPolicy < ApplicationPolicy
  def show?
    return true if @record.pincode.blank? || update?

    if @user.pincode.present? && @record.pincode_valid?(@user.pincode)
      @user.cookies["events_#{@record.id}_pincode"] = @user.pincode
    end

    pincode = @user.cookies["events_#{@record.id}_pincode"]

    @record.pincode_valid?(pincode)
  end

  def update?
    @record.user == @user.user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def create?
    @user.present?
  end

  def new?
    create?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
