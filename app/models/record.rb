require 'str_to_seconds'
class Record < ApplicationRecord
  belongs_to :title

  def loan_length
    if @_loan_length.nil?
      @_loan_length = self.title.max_loan
    end
    @_loan_length.to_human_time
  end

  def loan_length=(length)
    if length.is_a? Integer
      length = length.to_s
    end
    # test if max_loan is already an integer representing number of seconds
    unless length.nil?
      length = length.to_seconds
    end
    unless length.nil?
        @_loan_length = length
        write_attribute(:due, DateTime.current + length.seconds)
    end
  end
end
