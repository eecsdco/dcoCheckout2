require 'str_to_seconds'
class Record < ApplicationRecord
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

  after_initialize :initalize_default_loan
  after_initialize :initialize_default_office

  def loan_length
    # get loan length in human readable form (e.g. 2 days or 12 hours)
    self.loan_length_seconds.to_human_time unless self.loan_length_seconds.nil?
  end

  def loan_length=(length)
    # set loan length in human readable form
    self.loan_length_seconds = length.to_seconds unless length.nil?
  end

  def loan_length_seconds
    # get loan_length in seconds
    @loan_length_seconds
  end

  def loan_length_seconds=(length)
    # set loan length in seconds, and then update due time
    if length == 0
      @loan_length_seconds = nil
      write_attribute :due, nil
    else
      @loan_length_seconds = length
      write_attribute :due, DateTime.current + length.seconds
    end
  end

  # scope
  def self.out
    # return records which have not yet been checked in
    where(in: nil)
  end

  def self.overdue
    # return records that are overdue
    self.out.where('due < ?', DateTime.now).reorder(due: :desc)
  end

  def self.out_but_not_overdue
    # returns records which are not checked in, but which are also not overdue
    # useful for when you might be displaying records which are overdue and
    # then records that are out in two different areas
    self.out.where('due > ?', DateTime.now)
  end

  def self.borrower_is(borrower)
    if borrower.present?
      where(borrower: borrower)
    else
      where(nil)
    end
  end

  def self.office_is(id)
    if id.present?
      where(office_id: id)
    else
      where(nil)
    end
  end

  def self.title_like(name)
    # finds records where title name is like name
    # note that the % is inside the parameter because otherwise Rails will put
    # the quotes inside the %'s (eg. for name = kevin, Rails will try to say
    # titles.name LIKE %"kevin"% instead of LIKE "%kevin%")
    if name.present?
      joins(:title).where("titles.name LIKE ?", "%#{name}%")
    else
      where(nil)
    end
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
        errors.add(:option, "must be selected for this title")
      end
    end
  end

  # private
  def initalize_default_loan
    if new_record? and self.loan_length_seconds.nil? and self.title
      self.loan_length_seconds = self.title.loan_length_seconds
    end
  end

  # private
  def initialize_default_office
    if new_record? and self.office.nil? and self.title
      write_attribute(:office_id,  self.title.office_id)
    end
  end
end
