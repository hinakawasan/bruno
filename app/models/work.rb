class Work < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioUploader
  
  belongs_to :genre
  belongs_to :user
end
