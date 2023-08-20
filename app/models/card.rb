class Card < ApplicationRecord
  belongs_to :deck

  validates :front_text, presence: true, length: { maximum: 1000 }
  validates :back_text, presence: true, length: { maximum: 1000 }
  validates :done_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
