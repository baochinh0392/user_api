# frozen_string_literal: true
module Api
  module V1
    module User
      class OmniauthCallbacksController < Devise::OmniauthCallbacksController
        # You should configure your model like this:
        # devise :omniauthable, omniauth_providers: [:twitter]

        # You should also create an action method in this controller like this:
        # def twitter
        # end

        # More info at:
        # https://github.com/plataformatec/devise#omniauth

        # GET|POST /resource/auth/twitter
        def passthru
          super
        end

        # GET|POST /users/auth/twitter/callback
        # def failure
        #   super
        # end

        def google_oauth2
          generic_callback( "google_oauth2" )
        end

        def generic_callback(provider)
          @user = User.from_omniauth(request.env['omniauth.auth'])
          if @user.persisted?
            render json: { success: true, jwt: current_token, response: "Authentication successful" }
          else
            session["devise.#{provider}_data"] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
            json_error_response(@user.errors.full_messages.join("\n"))
          end
        end

        # protected

        # The path used when OmniAuth fails
        # def after_omniauth_failure_path_for(scope)
        #   super(scope)
        # end
      end
    end
  end
end
