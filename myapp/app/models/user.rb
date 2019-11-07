class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :social_profiles, dependent: :destroy

  def social_profile(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s }.first
  end

  def self.rand_email
    "#{SecureRandom.hex(8)}@test.com"
  end

  def self.rand_password
    SecureRandom.hex(8)
  end

  def self.from_omniauth(auth)
    joins(:social_profiles).where(social_profiles: { provider: auth.provider, uid: auth.uid }).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
