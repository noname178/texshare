# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  #include Cloudinary::CarrierWave
  process :convert => 'png'

  process :resize_to_fit => [400,400]

  process :fix_rotate

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def fix_rotate
    manipulate! do |img|
      img = img.auto_orient
      img = yield(img) if block_given?
      img
    end
  end


end