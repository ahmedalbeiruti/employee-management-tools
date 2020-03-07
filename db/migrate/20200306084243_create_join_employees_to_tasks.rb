# frozen_string_literal: true

class CreateJoinEmployeesToTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :join_employees_to_tasks do |t|
      t.belongs_to :employee
      t.belongs_to :task

      t.timestamps
    end
  end
end
