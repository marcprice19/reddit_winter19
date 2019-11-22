class Sub < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :topics
end
