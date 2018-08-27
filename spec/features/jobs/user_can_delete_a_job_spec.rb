require 'rails_helper'

describe 'user can delete an existing job' do
  scenario 'user can delete a new job' do
    company = Company.create(name: "Denver Museum of Nature and Science")
    category = Category.create(title: "IT")
    job = company.jobs.create(title: "IT Tech", level_of_interest: 3, city: "Denver", category_id: category.id)
    visit jobs_path
    click_link "Delete"
    expect(page).to_not have_content(job.title)
  end
end
