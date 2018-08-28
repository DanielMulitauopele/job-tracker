require 'rails_helper'

describe 'User edits existing job' do
  scenario 'a user can edit a job' do
    company = Company.create!(name: "Denver Museum of Nature and Science")
    job = company.jobs.create(title: "IT Tech", level_of_interest: 3, city: "Denver")
    visit job_path(job)
    save_and_open_page
    # require "pry"; binding.pry
    click_link "Edit"

    expect(current_path).to eq(edit_job_path(job))
    fill_in "job[title]", with:"Tech Specialist"
    fill_in "job[city]", with: "Mars"
    fill_in "job[level_of_interest]", with: 5

    click_button "Update"
    expect(current_path).to eq(jobs_path)
    expect(page).to have_content("Tech Specialist")
    expect(page).to have_content("Mars")
    expect(page).to have_content(5)
  end
end
