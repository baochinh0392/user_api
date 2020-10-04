module Api
  module V1
    module User
      ##
      # Api::V1::User::CreateService
      # This service responsible for create a user
      ##
      class CreateService < BaseService
        step :validate
        step :create_user

        private

        def validate(params)
          create_contract = User::CreateContract.new
          result = create_contract.call(params.to_h)

          if result.success?
            Success(result.to_h)
          else
            Failure(msgs: result.errors.to_h)
          end
        end

        def create_user(params)
          user = ::User.new(params)
          if user.save
            user.add_role :client
            Success(user)
          else
            Failure(msgs: user.errors.full_messages)
          end
        end
      end
    end
  end
end