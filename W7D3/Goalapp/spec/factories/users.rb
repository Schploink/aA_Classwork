FactoryBot.define do
  factory :user do
    username{Faker::Name.name}
    password{"123456"}

    factory :harry_potter do 
      username { "Harry Potter" }
    end 
  end
end
