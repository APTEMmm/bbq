class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_presence_of :event, :user
  has_one_attached :photo

  #mount_uploader :photo, PhotoUploader
  # Scope нужен, чтобы отделить реальные фотки от болванки,
  # которую мы прописали в контроллере событий
  scope :persisted, -> { where 'id IS NOT NULL' }
=begin
  validate :allowed_extname

  private

  def allowed_extname
    errors.add(:user_email, '123') if  %w[JPEG JPG PNG].exclude?(File.extname(photo).upcase)
  end
=end
end
