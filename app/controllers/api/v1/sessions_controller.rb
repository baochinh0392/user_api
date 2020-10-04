# frozen_string_literal: true
module Api
  module V1
    class SessionsController < Devise::SessionsController
      include Devise::Controllers::Helpers
      skip_before_action :verify_authenticity_token 

      prepend_before_action :require_no_authentication, only: [:create]

      # before_action :rewrite_param_names, only: [:create]

      def new
        render json: { response: "Authentication required" }, status: 401
      end

      def create
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        yield resource if block_given?
        render json: {success: true, jwt: current_token, response: "Authentication successful" }
      end

      private

      def rewrite_param_names
        request.params[:user] = {email: request.params[:email], password: request.params[:password]}
      end

      def current_token
        request.env['warden-jwt_auth.token']
      end
    end
  end
end
