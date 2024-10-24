class Comic < ApplicationRecord

  belongs_to :genre
  has_many :comic_bookshelves
  has_many :bookshelves, through: :comic_bookshelves

  validates :title, presence: { message: "タイトルを入力してください" }
  validates :volume, presence: { message: "既巻数を入力してください" }
  validates :next_date, presence: { message: "次巻発売日を入力してください" }
  
end
