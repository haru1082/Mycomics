class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # has_many :comic_bookshelves  
  # has_many :bookshelves, through: :comic_bookshelves, source: :comic
  has_many :reviews, dependent: :destroy
  
  has_many :bookshelves
  has_many :comics, through: :bookshelves
  
  validates :nickname, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }
  
  def has_comic_in_bookshelf?(comic)
    bookshelves.exists?(comic_id: comic.id)
  end
  
end 
