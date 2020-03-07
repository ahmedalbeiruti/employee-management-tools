# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :join_employees_to_tasks, inverse_of: :employee, dependent: :destroy
  has_many :tasks, through: :join_employees_to_tasks
  has_many :future_tasks, -> { future_task }, through: :join_employees_to_tasks,
                                              source: :task

  scope :active, -> { where(status: 'active') }

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                    uniqueness: { case_sensitive: false }
end
