class Bookshelf < ApplicationRecord
  
  belongs_to :user
  has_many :comic_bookshelves
  has_many :comics, through: :comic_bookshelves
  
  
end
