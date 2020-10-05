# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist 
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = where(provider: access_token.provider, uid: access_token.uid).first_or_create do |user|
      user.email = data.email
      user.password = Devise.friendly_token[0,20]
      user.name = data.name
      user.image = data.image
      user.uid = access_token.uid
      user.provider = access_token.provider

      #  If you are using confirmable and the provider(s) you use validate emails
      # user.skip_confirmation!
    end
  end
  
  user
end
end
