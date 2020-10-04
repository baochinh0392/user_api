module Api
  module V1
    module User
      class EditContract < BaseContract
        schema do
          required(:id).filled(:integer)
          optional(:email).value(:string)
          optional(:name).value(:string)
        end

        rule(:id) do
          begin
            user = ::User.find(value)
            key.failure("Can't edit admin") if user.has_role? :admin
          rescue => e
            key.failure("User don't exist")
          end
        end
      end
    end
  end
end
