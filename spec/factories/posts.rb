FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "some information"
    adjustment "some teacher name"
    Department "ECE"
    # user_id User.first.id
    
  end

  factory :second_post , class: "Post" do
    date Date.yesterday
    rationale "some information"
    adjustment "some teacher name"
    Department "ECE"
    # user_id User.last.id
    
  end
end