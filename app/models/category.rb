class Category < ApplicationRecord
  has_many :payments, foreign_key: 'category_id'
  belongs_to :user, optional: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :icon, presence: true
end
