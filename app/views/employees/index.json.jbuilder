# frozen_string_literal: true
# frozen_string_literal: true

json.status 'Success'
json.employees @employees do |employee|
  json.id employee.id
  json.name employee.name
  json.email employee.email
  json.status employee.status
end
