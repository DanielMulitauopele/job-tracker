require 'rails_helper'

describe 'category index' do
  describe 'as a visitor' do
    before (:each) do
      @category_1 = Category.create!(title: 'Software Development')
      @category_2 = Category.create!(title: 'Marketing')
      @category_3 = Category.create!(title: 'Custodial')
    end
    it 'should show category title' do
      visit categories_path
      expect(page).to have_content(@category_1.title)
      expect(page).to have_content(@category_2.title)
      expect(page).to have_content(@category_3.title)
    end
    it 'should delete category' do
      visit categories_path

      click_button('Delete', match: :first)
      expect(page).to_not have_content(@category_1.title)
      expect(page).to have_content(@category_2.title)
      expect(page).to have_content(@category_3.title)
    end
    it 'should take user to edit category page' do
      visit categories_path

      click_button 'Edit', match: :first
      expect(current_path).to eq(edit_category_path(@category_1))
    end
    it 'should take user to create new category page' do
      visit categories_path

      click_link 'Create New Category'
      expect(current_path).to eq(new_category_path)
    end
  end
end
