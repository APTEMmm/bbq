class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_presence_of :event, :user
  has_one_attached :photo

  validates :photo, attached: true, content_type: %i[png jpg jpeg]

  scope :persisted, -> { where 'id IS NOT NULL' }
end
