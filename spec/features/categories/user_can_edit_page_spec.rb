require 'rails_helper'

describe 'user can edit page' do
  describe 'user accesses from categories page' do
    before (:each) do
      @category = Category.create!(title: "Boring Jobs")
    end
    it 'should display edit category page' do
      visit categories_path
      click_button 'Edit'

      expect(current_path).to eq(edit_category_path(@category))
    end
    it 'should edit category title' do
      visit categories_path
      click_button 'Edit'

      fill_in "category_title", with: 'Brand New Title!'
      click_button "Update Category"

      expect(current_path).to eq(categories_path)
      expect(page).to have_content('Brand New Title!')
    end
  end
end
