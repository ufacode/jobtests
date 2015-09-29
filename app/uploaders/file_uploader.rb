class FileUploader < CarrierWave::Uploader::Base

  storage :file

  def cache_dir
    "#{Rails.root}/tmp/uploads/#{Rails.env}/files"
  end

  def store_dir
    "system/attachments/#{Rails.env}/files/#{model.friendly_id}/"
  end


end
