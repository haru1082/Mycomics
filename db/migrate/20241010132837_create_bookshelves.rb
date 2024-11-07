class CreateBookshelves < ActiveRecord::Migration[6.1]
  def change
    create_table :bookshelves do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comic, null: false, foreign_key: true
      t.string :name
      t.integer :owned_volume
      
      t.timestamps
    end
    
    add_index :bookshelves, [:user_id, :comic_id], unique: true
    
  end
end
