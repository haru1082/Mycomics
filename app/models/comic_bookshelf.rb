class ComicBookshelf < ApplicationRecord
  
  has_many :comics
  has_many :bookshelfs
  
end
