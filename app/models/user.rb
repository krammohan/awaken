class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth auth
    self.find_user auth
  end

  def check_and_construct
    if self.calendar
      Calendar.construct(self)#.whatever info is needed for cal API
    end
    if self.weather
      Weather.construct(self.zip)
    end
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
