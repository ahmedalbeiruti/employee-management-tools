# frozen_string_literal: true
# frozen_string_literal: true

json.status 'Success'
json.employees @employees do |employee|
  json.name employee.name
  json.email employee.email
  json.status employee.status
end
