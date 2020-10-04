class Api::V1::AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  # List users
  def users
    Api::V1::User::ListService.new.call(parameters) do |response|
      response.success do |data|
        data = paginated(data)
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error)
      end
    end
  end

  # Remove a user
  def remove_user
    Api::V1::User::RemoveService.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error)
      end
    end
  end

  # Edit a user
  def edit_user
    Api::V1::User::EditService.new.call(parameters) do |response|
      response.success do |data|
        json_response(data)
      end

      response.failure do |error|
        json_error_response(error)
      end
    end
  end

  private

  def parameters
    params.permit!
  end

  def check_admin
    json_error_response('you are not admin, please login with admin account') unless current_user.has_role? :admin
  end
end