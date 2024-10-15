class Comic < ApplicationRecord
  
  belongs_to :genre
  belongs_to :comic_bookshelf
end
