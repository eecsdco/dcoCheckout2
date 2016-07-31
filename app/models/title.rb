class Title < ApplicationRecord
  belongs_to :category
  belongs_to :notice, optional: true
  has_many :records

  validates :notice_id, presence: true, allow_nil: true
end

