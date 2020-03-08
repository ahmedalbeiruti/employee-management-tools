# frozen_string_literal: true

json.status 'Success'
json.tasks @tasks.map do |task|
  json.id task.id
  json.name task.name
  json.execution_date task.execution_date
end
