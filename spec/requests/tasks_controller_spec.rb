# frozen_string_literal: true

require 'rails_helper'
# let(:employee) {}

RSpec.describe TasksController, type: :request do
  # get all tasks

  it 'returns all tasks of an employee' do
    employee = create(:employee)
    create_employee_tasks(:future_date, employee)
    create_employee_tasks(:past_date, employee)

    get "/employees/#{employee.id}/tasks", xhr: true

    expect(json['tasks'].size).to eq(10)
  end

  it 'returns all future tasks of an employee when future param is true' do
    employee = create(:employee)
    create_employee_tasks(:future_date, employee)
    create_employee_tasks(:past_date, employee)

    get "/employees/#{employee.id}/tasks?future=true", xhr: true

    expect(json['tasks'].size).to eq(5)
  end

  it 'returns not found error when employee has no tasks' do
    employee = create(:employee)

    get "/employees/#{employee.id}/tasks", xhr: true

    expect(response).to have_http_status(404)
    expect(json['message']).to match('Not Found')
  end
end

def create_employee_tasks(date_trait, employee)
  create(:employee_with_tasks, tasks_count: 5, tasks_date: date_trait,
                               employee: employee)
end
