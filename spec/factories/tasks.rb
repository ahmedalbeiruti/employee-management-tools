# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { Faker::Name.name }
    trait :future_date do
      execution_date do
        Faker::Date.between(from: 1.day.from_now,
                            to: 1.year.from_now)
      end
    end

    trait :past_date do
      execution_date { Faker::Date.between(from: 20.days.ago, to: Date.today) }
    end

    transient do
      employees_count { 0 }
    end

    transient do
      task { nil }
    end
    factory :task_with_employees do
      after(:create) do |_task, evaluator|
        create_list(:employee,
                    evaluator.employees_count,
                    tasks: [evaluator.task])
      end
    end
  end
end
