require 'rails_helper'

describe 'category show' do
  describe 'as a visitor' do
    before(:each) do
      @category_1 = Category.create(title: 'Software Development')
      @category_2 = Category.create(title: 'Marketing')
      @company_1 = Company.create!(name: "Google")
      
      @job_1 = @company_1.jobs.create(title: 'Developer', description: 'fun!', level_of_interest: 5, city: 'Denver', category_id:@category_1.id)
      @job_2 = @company_1.jobs.create(title: 'Ad Man', description: 'Don Draper', level_of_interest: 3, city: 'Denver', category_id:@category_1.id)
      @job_3 = @company_1.jobs.create(title: 'Janitor', description: 'How you like them apples?', level_of_interest: 1, city: 'Denver', category_id:@category_1.id)
    end

    it 'should show category title' do
      visit category_path(@category_1)

      within('h1')
      expect(page).to have_content("#{@category_1.title} Jobs")
    end
    it 'should show titles under job' do
      visit category_path(@category_1)

      within('ul')
      expect(page).to have_content("Title: #{@job_1.title}")
    end
    it 'should show company under job' do
      visit category_path(@category_1)

      within('ul')
      expect(page).to have_content("Company: #{@job_1.company.name}")
    end
    it 'should show city under job' do
      visit category_path(@category_1)

      within('ul')
      expect(page).to have_content("City: #{@job_1.city}")
    end
    it 'should show interest under job' do
      visit category_path(@category_1)

      within('ul')
      expect(page).to have_content("Interest: #{@job_1.level_of_interest}")
    end
    # it 'should delete category' do
    #   visit '/categories'
    #
    #   click_button('Delete', match: :first)
    #   expect(page).to_not have_content(@category_1.title)
    #   expect(page).to have_content(@category_2.title)
    #   expect(page).to have_content(@category_3.title)
    # end
  end
end
