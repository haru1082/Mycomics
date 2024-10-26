class Comic < ApplicationRecord

  belongs_to :genre
  has_many :comic_bookshelves
  has_many :bookshelves, through: :comic_bookshelves
  
  has_one_attached :image
  
  validates :genre_id, presence: { message: "ジャンルを選択してください" }
  validates :title, presence: { message: "タイトルを入力してください" }
  validates :volume, presence: { message: "既巻数を入力してください" }, numericality: { only_integer: true, greater_than: 0 }
  validates :next_date, presence: { message: "次巻発売日を入力してください" }
  
  def image_with_default
    image.attached? ? image : Rails.root.join("app/assets/images/no_image.jpg")
  end
  
  def bookshelf_by?(user)
    bookshelf.exists?(user_id: user.id)
  end
  
end
