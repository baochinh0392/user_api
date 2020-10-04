FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2020-10-04 04:39:35" }
  end
end
