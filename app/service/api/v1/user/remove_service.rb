module Api
  module V1
    module User
      ##
      # Api::V1::User::RemoveService
      # This service responsible for remove a user
      ##
      class RemoveService < BaseService
        step :validate
        step :remove_user

        private

        def validate(params)
          remove_contract = User::RemoveContract.new
          result = remove_contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure(msgs: result.errors.to_h)
          end
        end

        def remove_user(params)
          user = ::User.find(params[:id])
          user.destroy
          if user.destroyed?
            Success(user: user, msg: "remove user successful!")
          else
            Failure(msgs: user.errors.full_messages)
          end
        end
      end
    end
  end
end