class CreateBookcommerts < ActiveRecord::Migration[6.1]
  def change
    create_table :bookcommerts do |t|
      t.text :comment
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
