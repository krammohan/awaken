require_relative '../../lib/weather_widget'

class User < ApplicationRecord
  has_many :devices
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth auth
    self.find_user auth
  end

  def construct_widgets
      puts "I AM INSIDE construct_widgets!!!"
    html_string = ""
    if self.weather
      puts "I AM INSIDE THE IF STATEMENT!!!!"
      html_string += WeatherWidget.get_weather(self.zip)
    end

    if self.maps
      html_string += MapsWidget.get_transit_info(self.origin_location, self.destination_location)
    end

    if self.news
      puts "I AM INSIDE THE IF STATEMENT FOR SELF.NEWS!!!"
      html_string += NewsWidget.get_news
    end

    self.content = html_string
    self.save
  end

  def reset_content
    self.content = "<div></div>"
    self.save
  end

  def toggle_weather
    if self.weather
      self.weather = false
    else
      self.weather = true
    end
    self.save
  end

  def toggle_maps
    if self.maps
      self.maps = false
    else
      self.maps = true
    end
    self.save
  end

  def toggle_news
    if self.news
      self.news = false
    else
      self.news = true
    end
    self.save
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
      user.channel = SecureRandom.urlsafe_base64
    end
  end



end
