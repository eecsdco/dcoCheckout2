require 'str_to_seconds'
class Record < ApplicationRecord
  # TODO XXX TODO XXX
  # This whole loan_length(=) thing is a cluster fuck at this point
  # It needs to be completely refactored probably
  # I think Record is better at this than Title is... but I'm not sure
  # Title actually has two separate attributes, whereas Title tries to
  # transform the actual attribute
  belongs_to :title

  def loan_length
    unless self[:out].nil? or self[:due].nil?
      @_loan_length = (self.due - self.out).round
    end

    if @_loan_length.nil?
      @_loan_length = self.title.max_loan.to_seconds
    end
    @_loan_length.to_human_time
  end

  def loan_length=(length)
    if length.nil?
      @_loan_length = 0
    end
    if length.is_a? Integer
      @_loan_length = length
    else
    # test if max_loan is already an integer representing number of seconds
      @_loan_length = length.to_seconds
      write_attribute(:due, DateTime.current + @_loan_length.seconds)
    end
  end
end
