class Review < ApplicationRecord

  belongs_to :comic, optional: true
  belongs_to :user

  validates :body, presence: { message: "感想を入力してください。" }

end
