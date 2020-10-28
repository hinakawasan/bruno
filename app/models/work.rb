class Work < ApplicationRecord
  mount_uploader :audio, AudioUploader
  mount_uploader :image, ImageUploader
  belongs_to :genre
  belongs_to :user
end
