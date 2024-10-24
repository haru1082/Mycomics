class ComicBookshelf < ApplicationRecord
  
  belongs_to :comics
  belongs_to :bookshelf
  
end
