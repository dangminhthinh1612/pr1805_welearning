class Content < ApplicationRecord
  mount_uploader :file_name, PictureUploader
  belongs_to :lesson
  enum content_type: [:text, :file]
end
