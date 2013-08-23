FactoryGirl.define do
  factory :tweet do
    sequence :id_twitter do |dynamic_id|
     dynamic_id 
    end
    text "umad?"
    canvas
    user
  end
end
