require 'rails_helper'

describe 'user can delete an existing job' do
  scenario 'user can delete a new job' do
    company = Company.create!(name: "Denver Museum of Nature and Science")
    job = company.jobs.create(title: "IT Tech", level_of_interest: 3, city: "Denver")
    # require "pry"; binding.pry
    visit company_jobs_path(company, job)

    save_and_open_page
    click_link "Delete"
    expect(page).to_not have_content(job.title)
  end
end
