class Bookshelf < ApplicationRecord
  
  belongs_to :comic_bookshelf
  belongs_to :user
  
end
