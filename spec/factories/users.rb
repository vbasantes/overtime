FactoryBot.define do

  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name {"John"}
    last_name {"Snow"}
    email {generate :email} # Each time a user is created, generate a different email address
    password {"asdfasdf"}
    password_confirmation {"asdfasdf"}
  end

  factory :admin_user, class: "AdminUser" do
    first_name {"Admin"}
    last_name {"User"}
    email {generate :email}
    password {"asdfasdf"}
    password_confirmation {"asdfasdf"}
  end
end
