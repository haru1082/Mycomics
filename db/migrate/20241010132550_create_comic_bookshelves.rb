class CreateComicBookshelves < ActiveRecord::Migration[6.1]
  def change
    create_table :comic_bookshelves do |t|
      t.references :user, foreign_key: true
      t.references :comic, foreign_key: true
      t.references :bookshelf, foreign_key: true
      
      t.timestamps
    end
  end
end
