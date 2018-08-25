require 'rails_helper'

describe 'category index' do
  describe 'as a visitor' do
    before (:each) do
      @category_1 = Category.create(title: 'Software Development')
      @category_2 = Category.create(title: 'Marketing')
      @category_3 = Category.create(title: 'Custodial')
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
    it 'should edit category' do
      visit '/categories'

      click_button('Edit', match: :first)
      expect(page).to have_content("Edit #{@category_1.title}")
    end

  end
end
