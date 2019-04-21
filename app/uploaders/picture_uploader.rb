class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  version :image, :if => :image? do
    process :resize_to_fit => [400, 400]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png mp4)
  end

  protected

  def image? new_file
    new_file.content_type.start_with? "image"
  end

end
