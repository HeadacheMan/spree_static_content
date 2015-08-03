FactoryGirl.define do
  factory :page_category, class: Spree::PageCategory do
    name {generate(:random_string)}
    sequence(:slug) { |n| "/category-#{n}" }
    description {generate(:random_description)}
  end
end