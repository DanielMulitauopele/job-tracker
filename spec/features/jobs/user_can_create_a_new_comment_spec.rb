require 'rails_helper'

describe 'user visits job show page' do
  scenario 'user can fill out a form for job comment'do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      visit job_path(job)
      fill_in "comment[content]", with: "Don't do it!"
      click_link "Create Comment"

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("Don't do it!")
    end
  end
