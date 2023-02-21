require 'rails_helper'

RSpec.describe "Index", type: :feature do
	let!(:it) { Department.create!(name: "IT", floor: "Top Level")}
	let!(:finance) { Department.create!(name: "Finance", floor: "Basement")}
	let!(:axel) {it.employees.create!(name: "Axel", level: 5)}
	let!(:meredity) {finance.employees.create!(name: "Meredith", level: 9)}

	describe "when I visit /departments" do	
		context "I see" do
			it "all the departments have info" do
				visit "/departments"
				expect(page).to have_content("name: IT")
				expect(page).to have_content("floor: Top Level")
				expect(page).to have_content("name: Finance")
				expect(page).to have_content("floor: Basement")
			end

			it 'lists the employees that belong to each department' do
				visit "/departments"
				expect(page).to have_content("Axel")
				expect(page).to have_content("Meredith")
			end
		end
	end
end