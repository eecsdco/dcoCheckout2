require 'str_to_seconds'
class Title < ApplicationRecord
  belongs_to :category
  belongs_to :notice, optional: true
  belongs_to :office
  has_many :records

  validates :name, presence: true, :uniqueness => { :scope => :category } 
  validates :category, presence: true
  validates :description, presence: true, allow_nil: true
  validates :n_available, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :form_required, inclusion: { in: [true, false] }
  validates :notice_id, presence: true, allow_nil: true
  validates :max_loan, presence: true, allow_nil: false

  attr_accessor :max_loan

  def max_loan
    read_attribute(:max_loan)
  end

  def max_loan_seconds
    return self[:max_loan]
  end

  def max_loan=(length)
    if length.is_a? Integer
      length = length.to_s
    end
    logger.debug "max_loan= #{length}"
    # test if max_loan is already an integer representing number of seconds
    unless length.to_i.to_s == length or length.nil?
      length = length.to_seconds
    end
    logger.debug "max_loan= #{length}"
    write_attribute(:max_loan, length)
  end
end

