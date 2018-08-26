class ChangeCategories < ActiveRecord::Migration[5.1]
  def change
    change_table :categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
