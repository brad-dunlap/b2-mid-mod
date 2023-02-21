class EmployeeTicket < ApplicationRecord
  belongs_to :employees
  belongs_to :tickets
end
