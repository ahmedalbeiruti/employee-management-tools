# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeesController, type: :request do
  it 'returns all employees' do
    create_employees
    get '/employees', xhr: true

    expect(json['employees'].size).to eq(10)
  end

  it 'returns all active employees only when active param is true' do
    create_employees
    get '/employees?active=true', xhr: true

    expect(json['employees'].size).to eq(5)
  end

  it 'returns not found error when no employees found' do
    get '/employees', xhr: true
    expect(response).to have_http_status(404)
    expect(json['message']).to match('Not Found')
  end
end

def create_employees
  create_list(:employee, 5, :training)
  create_list(:employee, 5, :active)
end
