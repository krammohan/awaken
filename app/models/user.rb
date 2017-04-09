class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :widgets

  # def self.find_for_google_oauth2(auth)
  #   data = auth.info
  #   if validate_email(auth)
  #     user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.email = auth.info.email
  #       user.password = Devise.friendly_token[0,20]
  #     end
  #     user.token = auth.credentials.token
  #     user.refresh_token = auth.credentials.refresh_token
  #     user.save
  #     return user
  #   else
  #     return nil
  #   end
  # end

  def self.from_omniauth auth
    self.find_user auth
  end

  private

  def self.find_user auth
    if auth.provider == "google_oauth2"
      username = auth.extra.raw_info.name
    end

    where( provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.email    = "#{auth.uid}@app.com" 
      user.username = username
      user.password = Devise.friendly_token[0,20]
    end
  end


end
