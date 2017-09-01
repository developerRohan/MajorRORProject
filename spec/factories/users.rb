FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'rohan' 
    last_name 'arora'
    email { generate :email }
    password "abcdef"
    password_confirmation "abcdef"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'admin' 
    last_name 'user'
    email { generate :email }
    password "abcdef"
    password_confirmation "abcdef"
  end
end
