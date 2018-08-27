require 'rails_helper'

describe 'User edits existing job' do
  scenario 'a user can edit a new job' do
    #company = Compnay.create(name: "Denver Museum of Nature and Science")
    category = Category.create(title: "IT")
    #when we make company should we go and make this job.company.create
    job = Job.create(title: "IT Tech", level_of_interest: 3, city: "Denver", category_id: category.id)
    visit job_path(job)
    click_link "Edit"
    expect(current_path).to eq(edit_job_path(job))
    fill_in "job[title]", with:"Tech Specialist"
    fill_in "job[city]", with: "Mars"
    fill_in "job[level_of_interest]", with: 5

    click_button "Update"
    expect(current_path).to eq(job_path(job))
    expect(current_page).to have_content("Tech Specialist")
    expect(current_page).to have_content("Mars")
    expect(current_page).to have_content(5)
  end
end
