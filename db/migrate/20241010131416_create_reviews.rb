class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.references :comic, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
