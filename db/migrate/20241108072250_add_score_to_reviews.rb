class AddScoreToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :score, :float
  end
end
