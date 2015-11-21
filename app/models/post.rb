class Post < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, length: { maximum: 255 }

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  delegate :full_name, to: :author, prefix: true, allow_nil: true

  scope :newests, -> { order('created_at DESC') }

  acts_as_paranoid

  mount_uploader :image, PostUploader

  acts_as_commontable
end
