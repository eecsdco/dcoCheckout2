class StatisticsController < ApplicationController
  def index
    @titles_count_hash = Record.group(:title_id).order('count_all DESC')
      .count.map {|id, count| [Title.find(id), count]}
  end
end