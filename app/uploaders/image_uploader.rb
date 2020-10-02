class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  process resize_to_fit: [600, 600]


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def size_range
    1..4.megabytes
  end

end
