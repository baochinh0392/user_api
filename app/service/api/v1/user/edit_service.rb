module Api
  module V1
    module User
      ##
      # Api::V1::User::EditService
      # This service responsible for edit a user
      ##
      class EditService < BaseService
        step :validate
        step :edit_user

        private

        def validate(params)
          edit_contract = User::EditContract.new
          result = edit_contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure(msgs: result.errors.to_h)
          end
        end

        def edit_user(params)
          user = ::User.find(params[:id])
          if user.update(params)
            Success(user: user, msg: "User updated!")
          else
            Failure(msgs: user.errors.full_messages)
          end
        end
      end
    end
  end
end