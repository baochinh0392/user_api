module Api
  module V1
    module User
      ##
      # Api::V1::User::ListService
      # This service responsible for list and filter users
      ##
      class ListService < BaseService
        step :validate
        step :list_user
        step :filter_user

        private

        def validate(params)
          list_contract = User::ListContract.new
          result = list_contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure(msgs: result.errors.to_h)
          end
        end

        def list_user(params)
          params[:users] = ::User.with_role(:client)
          Success(params)
        end

        def filter_user(params)
          users = params[:users]
          users = users.ransack(email_cont: params[:email]).result if params[:email].present?
          users = users.ransack(name_cont: params[:name]).result if params[:name].present?
          Success(users)
        end
      end
    end
  end
end