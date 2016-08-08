class Office < ApplicationRecord
  has_many :titles

  validates :name, presence: true
  validates :address, presence: true
end
