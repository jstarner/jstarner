class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2 twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      data = auth.info
      if auth.info.email != nil
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      else
        user.email = auth.info.nickname
        user.password = Devise.friendly_token[0,20]
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      elsif data = session['devise.twitter_data'] && session['devise.twitter_data']['raw_info']
        user.email = data['nickname'] if user.email.blank?
      elsif data = session['devise.google_data'] && session['devise.google_data']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
