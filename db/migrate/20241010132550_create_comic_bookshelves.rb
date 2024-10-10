class CreateComicBookshelves < ActiveRecord::Migration[6.1]
  def change
    create_table :comic_bookshelves do |t|
      t.integer :bookshelves_id
      t.integer :comics_id
      
      t.timestamps
    end
  end
end
