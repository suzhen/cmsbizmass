# encoding: utf-8

class LinkUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do 
    process :resize_to_fill => [50, 17]  
  end  
   
  version :normal do 
    process :resize_to_fill => [100, 35]  
  end  
   
  version :original 

    def extension_white_list
     %w(jpg jpeg gif png)
  end

end
