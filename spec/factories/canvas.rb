FactoryGirl.define do
  # blocks association is already handle in an after create
  factory :canvas do
    title "Noisy Keychains"
    user
  end
end
