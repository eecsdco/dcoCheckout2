require 'str_to_seconds'
class Category < ApplicationRecord
  has_many :titles
  def loan_length
    unless self.loan_length_seconds.nil?
      self.loan_length_seconds.to_human_time
    end
  end

  def loan_length=(length)
    self.loan_length_seconds = length.to_seconds
  end
end
