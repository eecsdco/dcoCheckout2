require 'str_to_seconds'
class Record < ApplicationRecord
  # TODO XXX TODO XXX
  # This whole loan_length(=) thing is a cluster fuck at this point
  # It needs to be completely refactored probably
  # I think Record is better at this than Title is... but I'm not sure
  # Title actually has two separate attributes, whereas Title tries to
  # transform the actual attribute
  belongs_to :title
  has_one :office, :through => :title

  validates :title_id, presence: true
  validate :title_exists
  validates :borrower, presence: true
  # note
  validates :agent, presence: true
  validates :out, presence: true
  # in
  # due
  # return_approved

  def loan_length
    self.loan_length_seconds.to_human_time
  end

  def loan_length=(length)
    self.loan_length_seconds = length.to_seconds unless length.nil?
  end

  def loan_length_seconds
    if @loan_length_seconds.nil?
      if self.due and self.out
        @loan_length_seconds = (self.due - self.out).round.days
      elsif new_record? and !self.title.nil?
        @loan_length_seconds = self.title.loan_length_seconds
      end
    end
    @loan_length_seconds
  end

  def loan_length_seconds=(length)
    @loan_length_seconds = length
    self.due = DateTime.current + length.seconds
  end

  def title_exists
    errors.add(:title_id, "is not a valid title") unless Title.find_by_id(self.title_id)
  end
end
