# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should have_many(:join_employees_to_tasks) }
  it { should have_many(:employees).through(:join_employees_to_tasks) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:execution_date) }
end
