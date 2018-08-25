require 'rails_helper'

describe Category, type: :model do
  # before (:each) do
  #   category_1 = Category.create(title: 'Software Development')
  # end
  describe 'validations' do
    it {should validate_presence_of(:title)}
  end
end
