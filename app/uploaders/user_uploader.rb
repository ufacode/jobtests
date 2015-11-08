class UserUploader < AppUploader
  process resize_to_fill: [400, 400]

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :mini do
    process resize_to_fill: [100, 100]
  end
end
