require 'str_to_seconds'
class Title < ApplicationRecord

  belongs_to :category
  belongs_to :notice, optional: true
  belongs_to :office, optional: true
  has_many :records

  validates :name, presence: true, :uniqueness => { :scope => [:category] } 
  validates :category, presence: true
  validates :description, presence: true, allow_nil: true
  validates :n_available, presence: true, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :notice_id, presence: true, allow_nil: true
  validates :loan_length_seconds, presence: true, allow_nil: false
  #validates :office_id, presence: true, allow_nil: true

  validate :office_id_and_n_available

  after_initialize :initialize_default_loan

  def n_in
    unless self.n_available.nil?
      # return zero instead of a negative number
      [self.n_available - self.n_out, 0].max
    end
  end

  def n_out
    self.records.where(in: nil).length
  end

  def available?
    if !self.enabled
      # if a title is disabled, there are none available for checkout
      return false
    elsif self.n_available.nil?
      # if a title has a nil n_available, there are an infinite number available for checkout
      return true
    end
    # if the title is enabled, and has a limited numeber available, the title
    # is enabled if and only if the number in stock is 1 or more
    return n_in > 0
  end

  def loan_length
    self.loan_length_seconds.to_human_time unless self.loan_length_seconds.nil?
  end

  def loan_length=(length)
    self.loan_length_seconds = length.to_seconds
  end

  def average_loan_time_seconds
    unless ActiveRecord::Base.connection.instance_of? ActiveRecord::ConnectionAdapters::Mysql2Adapter
      # unfortunately, this is not database agnostic, and this will only
      # (as far as I know) work using MySQL
      return nil
    end
    returned_records = records.where.not(in:nil)
    if returned_records.present?
      return returned_records.average('unix_timestamp(`in`) - unix_timestamp(`out`)').round
    else
      return nil
    end
  end

  def average_loan_time
    unless average_loan_time_seconds.nil?
      average_loan_time_seconds.to_human_time
    end
  end

  def options
    # split string on newlines or commas, then remove whitespace from each
    # option
    if options_str.nil? or options_str.empty?
      # return an empty list so that .in? or .include? doesn't complain
      return []
    else
      return options_str.split("\n")
    end
  end

  def options=(options_array)
    options_array.each { |option| option.strip! }
    write_attribute :options_str, options_array.join("\n")
  end

  def options_str=(new_options_str)
    self.options = new_options_str.split("\n")
  end

  def popularity
    # return the total number of checkouts for sorting purposes
    Rails.cache.fetch("#{cache_key}/popularity", expires_in: 24.hours) do
      self.records.length
    end
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

  #private
  def office_id_and_n_available
    # validation; checks that n_available is only set when office_id is set
    if !n_available.nil? and office_id.nil?
      errors.add(:n_available, "is not a valid option for this title")
    end
  end
end

