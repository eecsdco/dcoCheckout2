require 'str_to_seconds'
class Category < ApplicationRecord
  has_many :titles

  validates :name, presence: true
  validates :description, presence: true
  validates :loan_length_seconds, presence: true

  # before_save :update_titles_enabled

  def loan_length
    unless self.loan_length_seconds.nil?
      self.loan_length_seconds.to_human_time
    end
  end

  def loan_length=(length)
    self.loan_length_seconds = length.to_seconds
  end

  def enabled
    # the category is enabled if it has any enabled titles within it
    !titles.where(enabled: true).empty?
  end

  def popularity
    # return the total number of checkout records for all titles within the
    # category for sorting purposes (i.e. categories with most checkouts are
    # listed first in the checkout menu)
    @popularity = 0
    Rails.cache.fetch("#{cache_key}/popularity", expires_in: 12.hours) do
      self.titles.each do |title|
        @popularity += title.popularity
      end
    end
    @popularity
  end

  #############################################################################
  private #####################################################################
  #############################################################################

  # def update_titles_enabled
  #   if enabled_changed?
  #     titles.each do |title|
  #       unless title.update(enabled: self.enabled)
  #         raise RuntimeError.new("Unable to update enabled status on title: #{title.name}")
  #       end 
  #     end
  #   end
  # end


end
