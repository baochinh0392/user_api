module Api
  module V1
    module User
      class CreateContract < BaseContract
        schema do
          required(:email).filled(:string)
          required(:password).filled(min_size?: 8)
          required(:password_confirmation).filled(min_size?: 8)
        end
      end
    end
  end
end
