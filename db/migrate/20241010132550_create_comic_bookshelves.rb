class CreateComicBookshelves < ActiveRecord::Migration[6.1]
  def change
    create_table :comic_bookshelves do |t|

      t.timestamps
    end
  end
end
