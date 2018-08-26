class DeleteColumunCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :Title
  end
end
