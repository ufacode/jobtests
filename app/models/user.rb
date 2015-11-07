class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,  :timeoutable and
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :omniauthable, omniauth_providers: %i(github)

  validates :name, presence: true

  has_many :identities

  def full_name
    name.present? ? name : email
  end

  def self.create_with_omniauth(info)
    create(name: info['name'])
  end
end
