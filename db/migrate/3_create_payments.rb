class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :category_id
      t.integer :author_id
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
