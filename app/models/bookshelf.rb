class Bookshelf < ApplicationRecord
  
  belongs_to :user
  has_many :comic_bookshelves
  has_many :comics, through: :comic_bookshelves

  def user_count
    comic_bookshelves.joins(:user).distinct.count(:user_id)
  end
end
