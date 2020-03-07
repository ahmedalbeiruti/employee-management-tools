# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :join_employees_to_tasks, inverse_of: :task, dependent: :destroy
  has_many :employees, through: :join_employees_to_tasks

  scope :future_task, -> { where('execution_date > ?', Date.today) }

  validates :name, presence: true
  validates :execution_date, presence: true
end
