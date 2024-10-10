class CreateBookshelves < ActiveRecord::Migration[6.1]
  def change
    create_table :bookshelves do |t|
      t.integer :user_id
      t.string :title
      t.string :name
      t.integer :owned_volume
      
      t.timestamps
    end
  end
end
