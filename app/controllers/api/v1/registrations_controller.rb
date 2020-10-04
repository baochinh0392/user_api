# frozen_string_literal: true
module Api
  module V1
    ##
    # Api::V1::RegistrationsController
    # This controller responsible for register User
    ##
    class RegistrationsController < Devise::RegistrationsController
      skip_before_action :verify_authenticity_token, only:[:create]
      # sign up
      def create
        Api::V1::User::CreateService.new.call(user_params) do |response|
          response.success do |data|
            json_response(data)
          end

          response.failure do |error|
            json_error_response(error)
          end
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
