class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.integer :author_id

      t.timestamps
    end
  end
end
