require 'rails_helper'

RSpec.describe "Show", type: :feature do
	let!(:it) { Department.create!(name: "IT", floor: "Top Level")}
	let!(:axel) {it.employees.create!(name: "Axel", level: 5)}
	let!(:bug) { Ticket.create!(subject: "Bug", age: 1)}
	let!(:refactor) { Ticket.create!(subject: "Refactor", age: 3)}
 
	before do
		EmployeeTicket.create!(employee: axel, ticket: bug)
		EmployeeTicket.create!(employee: axel, ticket: refactor)
		visit "/employees/#{axel.id}"
	end
	describe "when I visit /employees/:id" do	
		context "I see the employee info and tickets" do
			it "shows employees name and department" do
				save_and_open_page
				expect(page).to have_content("Name: Axel")
				expect(page).to have_content("Department: IT")
			end

			it 'lists of tickets from oldest to youngest' do 
				expect("Refector").to appear_before("Bug")
			end
		end
	end
end