require 'rails_helper'

describe 'user can can create new category' do
  describe 'user accesses from categories page' do
    before (:each) do
      @category = Category.create!(title: "Boring Jobs")
    end
    it 'should display new category page' do
      visit categories_path
      click_link 'Create New Category'

      expect(current_path).to eq(new_category_path)
    end
    it 'should edit category title' do
      visit categories_path
      click_link 'Create New Category'

      fill_in "category_title", with: 'Brand New Title!'
      click_button "Create Category"

      expect(current_path).to eq(categories_path)
      expect(page).to have_content('Brand New Title!')
    end
  end
end
