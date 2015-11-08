class PostUploader < AppUploader
  process resize_to_fit: [1200, 400]

  version :medium do
    process resize_to_fill: [870, 400]
  end

  def default_url
    ActionController::Base.helpers.asset_path 'img1-870x400.jpeg'
  end
end
