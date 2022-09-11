module EventsHelper
  def event_owner?(current_user, event)
    current_user == event.user
  end

  def already_subscribed?(user, event)
    user.present? ? user.subscriptions.find_by(event_id: event.id).present? : false
  end
end
