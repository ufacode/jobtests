class JobTest < ActiveRecord::Base
  mount_uploader :file, FileUploader
  validates :title, presence: true
  validates :description, presence: true
end
