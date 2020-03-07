# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :employee

  def index
    @tasks = if params[:future].present? && params[:future] == 'true'
               @employee.future_tasks
             else
               @employee.tasks
             end
    raise ActiveRecord::RecordNotFound if @tasks.empty?
  end

  private

  def employee
    # find will raise ActiveRecord::RecordNotFound exception
    # if employee id doesn't exist
    @employee = Employee.find(params[:employee_id])
  end
end
