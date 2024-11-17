class Review < ApplicationRecord

  belongs_to :comic, optional: true
  belongs_to :user

  validates :title, presence: { message: "タイトルを入力してください。"}, allow_blank: false
  validates :body, presence: { message: "感想を入力してください。" }, allow_blank: false
  validates :score, numericality: true

end
