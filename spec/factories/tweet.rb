FactoryGirl.define do
  factory :tweet do
    sequence :id_twitter do |dynamic_id|
     dynamic_id 
    end
    user
  end
end
