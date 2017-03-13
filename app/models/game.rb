class Game < ApplicationRecord
  mount_uploader :image, AvatarUploader

  validates :image, presence: true
  validates :name, presence: true

  scope :ordered, -> { order(:name) }
end
