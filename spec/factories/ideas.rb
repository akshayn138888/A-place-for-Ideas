FactoryBot.define do
  factory :idea, class: 'Idea' do
    sequence(:title) { |n| Faker::Job.title + " #{n}" }  
    description { Faker::Job.field}
    association(:user, factory: :user)
  end
end
