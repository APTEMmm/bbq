module EventsHelper
  def current_user_can_subscribe?(event)
    !(current_user == event.user || event.subscribers.include?(current_user))
  end

  def sub?(user, event)
    event.subscriptions.find_by(user_id: user&.id).present?
  end

  def subscription_path(user, event)
    event.subscriptions.find_by(user_id: user&.id).id
  end
end
