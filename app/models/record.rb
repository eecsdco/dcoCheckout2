require 'str_to_seconds'
class Record < ApplicationRecord
  # TODO XXX TODO XXX
  # This whole loan_length(=) thing is a cluster fuck at this point
  # It needs to be completely refactored probably
  # I think Record is better at this than Title is... but I'm not sure
  # Title actually has two separate attributes, whereas Title tries to
  # transform the actual attribute
  belongs_to :title
  belongs_to :office

  validates :title_id, presence: true

  # for some reason, this causes issues (saying that office_id must exist, when
  # it definitely does)
  #validates :office_id, presence: true

  validate :title_exists
  validates :borrower, presence: true
  # note
  validates :agent, presence: true
  validates :out, presence: true
  # in
  # due
  # return_approved
  validate :option_exists

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
    if length = 0
      @loan_length_seconds = nil
      self.due = nil
    else
      @loan_length_seconds = length
      self.due = DateTime.current + length.seconds
    end
  end

  def office_id
    # initialize office 
    if @office_id.nil? and self.title.present? and new_record?
      @office_id = self.title.office_id
    end
    @office_id
  end

  # scope
  def self.default_scope
    order(:out)
  end

  # scope
  def self.out
    # return records which have not yet been checked in
    where(in: nil)
  end

  def self.overdue
    # return records that are overdue
    self.out.where('due < ?', DateTime.now).reorder(:due)
  end

  def self.out_but_not_overdue
    # returns records which are not checked in, but which are also not overdue
    # useful for when you might be displaying records which are overdue and
    # then records that are out in two different areas
    self.out.where('due > ?', DateTime.now).reorder(:out)
  end

  #############################################################################
  private

  # private
  def title_exists
    errors.add(:title_id, "is not a valid title") unless Title.find_by_id(self.title_id)
  end

  # private
  def option_exists
    unless self.title.options.empty?
      unless self.option.in? self.title.options
        # TODO fix how this displays
        errors.add(:option, "You must select a valid option.")
      end
    end
  end
end
