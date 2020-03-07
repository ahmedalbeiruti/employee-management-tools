# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = if params[:active].present? && params[:active] == 'true'
                   Employee.all.active
                 else
                   Employee.all
                 end
    raise ActiveRecord::RecordNotFound if @employees.empty?
  end
end
