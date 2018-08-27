require 'rails_helper'

describe 'User edits existing job' do
  scenario 'a user can edit a new job' do
    company = Company.create(name: "Denver Museum of Nature and Science")
    category = Category.create(title: "IT")
    job = company.jobs.create(title: "IT Tech", level_of_interest: 3, city: "Denver", category_id: category.id)
    visit jobs_path(job)
    click_link "Edit"
    expect(current_path).to eq(edit_job_path(job))
    fill_in "job[title]", with:"Tech Specialist"
    fill_in "job[city]", with: "Mars"
    fill_in "job[level_of_interest]", with: 5

    click_button "Update"
    #save_and_open_page
    expect(current_path).to eq(jobs_path)
    expect(page).to have_content("Tech Specialist")
    expect(page).to have_content("Mars")
    expect(page).to have_content(5)
  end
end
