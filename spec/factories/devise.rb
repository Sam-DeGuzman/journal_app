FactoryBot.define do
  factory :user do
    id {1}
    firstname {"sample"}
    lastname {"example"}
    email {"sample@user.com"}
    password {"123456"}
  end

end