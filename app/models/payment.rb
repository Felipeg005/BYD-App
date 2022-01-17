class Payment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :categories, optional: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
