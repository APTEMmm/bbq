class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates_presence_of :event, :body

  validates :user_name, presence: true, unless: -> { user.present? }

  def user_name
    user.present? ? user.name : super
  end
end
