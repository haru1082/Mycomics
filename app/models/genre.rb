class Genre < ApplicationRecord
  
  has_many :comics
  
  validates :name, presence: true
end
