class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :subscription_to_own_event
  validate :email_already_exist, unless: -> { user.present? }

  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end

  private

  def subscription_to_own_event
    errors.add(:base, I18n.t('error.subscriptions.own_event')) if event.user == user
  end

  def email_already_exist
    errors.add(:user_email, I18n.t('error.subscriptions.email_already_exist')) if User.exists?(email: user_email)
  end
end
