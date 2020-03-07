# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    trait :active do
      status { 'active' }
    end
    trait :training do
      status { 'training' }
    end

    transient do
      tasks_count { 0 }
    end
    transient do
      tasks_date { :future_date }
    end
    transient do
      employee { nil }
    end
    factory :employee_with_tasks do
      after(:create) do |_employee, evaluator|
        create_list(:task, evaluator.tasks_count,
                    evaluator.tasks_date,
                    employees: [evaluator.employee])
      end
    end
  end
end
