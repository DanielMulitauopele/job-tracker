require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category_1 = Category.create!(title: 'Software Development')
    category_2 = Category.create!(title: 'Advertising')
    company = Company.create!(name: "ESPN")
    visit new_company_job_path(company)
    save_and_open_page
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create Job"

    expect(current_path).to eq(jobs_path)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
