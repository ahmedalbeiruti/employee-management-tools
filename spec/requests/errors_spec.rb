# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ErrorsController, type: :request do
  it 'returns routing error when route is not among the valid routes' do
    get '/employees/1'
    # json is a method in request_spec_helper.rb to parse json responses
    expect(json).to include('status' => 'Error', 'message' => 'Routing Error')
  end
end
