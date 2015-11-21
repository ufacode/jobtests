class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,  :timeoutable and
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :omniauthable, omniauth_providers: %i(github)

  # validates :name, presence: true

  has_many :identities

  mount_uploader :avatar, UserUploader

  acts_as_commontator

  def full_name
    name.present? ? name : email
  end

  def self.create_with_omniauth(info)
    create(name: info['name'] || info['nickname'] || info['first_name'] || info['email'],
           email: info['email'],
           password: Devise.friendly_token[0, 20]
          )
  end
end
