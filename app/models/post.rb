class Post < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, length: { maximum: 255 }

  scope :newests, ->{ order('created_at DESC') }
end
