require 'str_to_seconds'
class Title < ApplicationRecord
  # TODO XXX TODO XXX
  # See note at top of models/record.rb
  belongs_to :category
  belongs_to :notice, optional: true
  belongs_to :office
  has_many :records

  validates :name, presence: true, :uniqueness => { :scope => [:category, :office_id] } 
  validates :category, presence: true
  validates :description, presence: true, allow_nil: true
  validates :n_available, presence: true, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :notice_id, presence: true, allow_nil: true
  validates :loan_length_seconds, presence: true, allow_nil: false

  after_initialize :initialize_default_loan

  def n_in
    self.n_available - n_out unless self.n_available.nil?
  end

  def n_out
    self.records.where(in: nil).length
  end

  def loan_length
    self.loan_length_seconds.to_human_time unless self.loan_length_seconds.nil?
  end

  def loan_length=(length)
    self.loan_length_seconds = length.to_seconds
  end

  #############################################################################
  private #####################################################################
  #############################################################################

  # private
  # def category_must_be_enabled
  #   if enabled and !category.enabled
  #     errors.add(:enabled, "cannot be set if the title's category is not enabled")
  #   end
  # end

  # private
  def initialize_default_loan
    if self.category and self.loan_length_seconds.nil? and self.new_record?
      self.loan_length_seconds = self.category.loan_length_seconds
    end
  end
  
end

