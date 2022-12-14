class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github google_oauth2]
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create
  after_commit :link_subscriptions, on: :create

  validates :avatar, content_type: %i[png jpg jpeg]

  def set_name
    self.name = "Товарищ №#{rand(777)}" if name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: email)
                .update_all(user_id: id)
  end

  def self.find_for_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    provider = access_token.provider
    uid = access_token.uid

    where(uid: uid, provider: provider).first_or_create! do |user|
      user.name = access_token.info.name
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
