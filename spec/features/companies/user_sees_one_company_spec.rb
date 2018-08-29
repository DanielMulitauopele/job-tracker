require 'rails_helper'

describe "User sees one company" do
  before (:each) do
    @company = Company.create!(name: "ESPN")
    @company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")
  end
  scenario "a user sees a company" do
    visit company_path(@company)

    expect(current_path).to eq("/companies/#{@company.id}")
    expect(page).to have_content("ESPN")
  end
  describe "a user sees company contact form" do
    it 'should show contact form details' do
      visit company_path(@company)
      expect(page).to have_content('Name')
      expect(page).to have_content('Position')
      expect(page).to have_content('Email')
    end
    it 'should display sorted contacts' do
      company = Company.create!(name: "BOOYAH")
      company.contacts.create!(name: "Charlie Sheen", position: "Winning", email: "megahotstuff@gmail.com")

      visit company_path(company)
      save_and_open_page
      expect(page).to have_content('Charlie Sheen')
      expect(page).to have_content('Winning')
      expect(page).to have_content('megahotstuff@gmail.com')
    end
  end
end
