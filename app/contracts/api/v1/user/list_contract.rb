module Api
  module V1
    module User
      class ListContract < BaseContract
        schema do
          optional(:email).value(:string)
          optional(:name).value(:string)
        end
      end
    end
  end
end
