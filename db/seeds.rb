# frozen_string_literal: true

task1 = Task.create!(name: 'First task', execution_date: '30/12/2019')
task2 = Task.create!(name: 'Second task', execution_date: '20/01/2020')
task3 = Task.create!(name: 'Third task', execution_date: '22/05/2020')
task4 = Task.create!(name: 'Fourth task', execution_date: '25/04/2020')
task5 = Task.create!(name: 'Fifth task', execution_date: '25/07/2020')
task6 = Task.create!(name: 'Sixth task', execution_date: '25/12/2019')

Employee.create!(name: 'Kellan Stubbs', email: 'kellan@example.com',
                 status: 'active', tasks: [task1, task2, task3, task4])
Employee.create!(name: 'Cohan Legge', email: 'cohan@example.com',
                 status: 'active', tasks: [task5, task2, task3, task6])
Employee.create!(name: 'Bea Morton', email: 'bea@example.com',
                 status: 'training', tasks: [task1, task2, task4, task5])
Employee.create!(name: 'Tudor Winter', email: 'tudor@example.com',
                 status: 'active', tasks: [task1, task2, task3, task5])
Employee.create!(name: 'Kacey Roberts', email: 'kacey@example.com',
                 status: 'training', tasks: [task5, task2, task3, task4])
Employee.create!(name: 'Sabina Herman', email: 'sabina@example.com',
                 status: 'active', tasks: [task1, task4, task3, task5])
