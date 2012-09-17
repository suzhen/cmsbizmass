# encoding: utf-8

class AdUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  p "+++++++++++++"
  p @width
  #p @@height

#   process :scale => [@width,@height]
  
   def scale(width, height)
        resize_to_fill(width,height)
   end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

   def extension_white_list
     %w(jpg jpeg gif png)
   end
end
