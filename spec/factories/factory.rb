FactoryBot.define do
  factory :user do
    name { 'Sample User' }
    email { 'emaill@email.com' }
    password { 'password' }
  end

  factory :food do
    name { 'Food Item 1' }
    price { 5.0 }
    quantity { 10 }
    measurement_unit { 'unit' }
    user { association :user }
  end

  factory :recipe do
    name { 'Recipe Name' }
    description { 'Recipe Description' }
    preparation_time { 0.5 }
    cooking_time { 1 }
    user { association :user }
  end

  factory :recipe_food do
    recipe { association :recipe }
    food { association :food }
    quantity { 5 }
  end
end
