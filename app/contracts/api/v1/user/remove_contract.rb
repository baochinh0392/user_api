module Api
  module V1
    module User
      class RemoveContract < BaseContract
        schema do
          required(:id).filled(:integer)
        end

        rule(:id) do
          begin
            user = ::User.find(value)
            key.failure("Can't remove admin") if user.has_role? :admin
          rescue => e
            key.failure("User don't exist")
          end
        end
      end
    end
  end
end
