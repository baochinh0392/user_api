##
# The V1::BaseContract class define some macro for validation classes
##
class BaseContract < Dry::Validation::Contract
  # register_macro(:email_format) do
  #   key.failure('not a valid email format') if !Regex::VALID_EMAIL.match?(value) && value.present?
  # end
end
