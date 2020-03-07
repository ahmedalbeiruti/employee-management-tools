# frozen_string_literal: true

class JoinEmployeesToTask < ApplicationRecord
  belongs_to :employee, inverse_of: :join_employees_to_tasks
  belongs_to :task, inverse_of: :join_employees_to_tasks
end
