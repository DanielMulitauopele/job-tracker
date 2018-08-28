require 'rails_helper'

describe 'as a user' do
  describe 'user can see the dashboard' do
    before (:each) do
      @company1 = Company.create!(name: 'ESPN')
      @company2 = Company.create!(name: 'Google')
      @company3 = Company.create!(name: 'Twitter')
      @company4 = Company.create!(name: 'GoDaddy')

      @category = Category.create!(title: 'Something')

      @job1 = @company1.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 1, city: 'Denver', category_id: @category.id)
      @job2 = @company1.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 1, city: 'Denver', category_id: @category.id)
      @job3 = @company2.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 2, city: 'Denver', category_id: @category.id)
      @job4 = @company2.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 2, city: 'Boulder', category_id: @category.id)
      @job5 = @company2.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 3, city: 'Boulder', category_id: @category.id)
      @job6 = @company3.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 3, city: 'Reno', category_id: @category.id)
      @job7 = @company3.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 3, city: 'Reno', category_id: @category.id)
      @job8 = @company3.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 4, city: 'Atlanta', category_id: @category.id)
      @job9 = @company4.jobs.create!(title: 'Dev', description: 'None', level_of_interest: 5, city: 'Portland', category_id: @category.id)
    end
    it 'should display a count of jobs by level of interest' do
      visit dashboard_index_path
      save_and_open_page
      within(".level-of-interest-count-5") do
        expect(page).to have_content(1)
      end
      within(".level-of-interest-count-4") do
        expect(page).to have_content(1)
      end
      within(".level-of-interest-count-3") do
        expect(page).to have_content(3)
      end
      within(".level-of-interest-count-2") do
        expect(page).to have_content(2)
      end
      within(".level-of-interest-count-1") do
        expect(page).to have_content(2)
      end
    end
  end
end
