require 'rails_helper'

describe 'category index' do
  describe 'as a visitor' do
    before (:each) do
      @category_1 = Category.create!(title: 'Software Development')
      #require 'pry'; binding.pry
      @category_2 = Category.create!(title: 'Marketing')
      @category_3 = Category.create!(title: 'Custodial')
    end
    it 'should show category title' do
      visit '/categories'

      expect(page).to have_content(@category_1.title)
      expect(page).to have_content(@category_2.title)
      expect(page).to have_content(@category_3.title)
    end
    it 'should delete category' do
      visit '/categories'

      click_button('Delete', match: :first)
      expect(page).to_not have_content(@category_1.title)
      expect(page).to have_content(@category_2.title)
      expect(page).to have_content(@category_3.title)
    end
    it 'should take user to edit category page' do
      visit '/categories'

      click_button 'Edit', match: :first
      expect(current_path).to eq(edit_category_path(@category_1))
      #expect(page).to have_content("Edit #{@category_1.title}")
    end

  end
end
