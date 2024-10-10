class CreateComics < ActiveRecord::Migration[6.1]
  def change
    create_table :comics do |t|
      t.integer :genre_id
      t.string :title
      t.integer :volume
      t.date :next_date


      t.timestamps
    end
  end
end
