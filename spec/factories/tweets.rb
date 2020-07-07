FactoryBot.define do
  factory :tweet do
    text {"hello!"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end