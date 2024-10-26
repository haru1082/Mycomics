class ComicBookshelf < ApplicationRecord
  
  belongs_to :comic
  belongs_to :bookshelf
  belongs_to :user
  
end
