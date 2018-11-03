class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :text, presence: true, length: { minimum: 10, maximum: 800 }
  validates :user_id, presence: true
end