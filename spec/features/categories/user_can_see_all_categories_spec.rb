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
  end
end
