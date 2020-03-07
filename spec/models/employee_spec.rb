# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { Employee.new(email: 'john@doe.com', name: 'John Doe') }
  it { should have_many(:join_employees_to_tasks).dependent(:destroy) }
  it { should have_many(:tasks).through(:join_employees_to_tasks) }
  it {
    should have_many(:future_tasks)
      .through(:join_employees_to_tasks)
      .source(:task)
  }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of(:email).is_at_most(255) }
  it {
    should_not allow_values('example@.com',
                            '@example.com',
                            'example@example').for(:email)
  }
end
