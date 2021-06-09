# frozen_string_literal: true

class SearchService
  attr_reader :query, :filter_by, :resource, :filter_range

  def initialize(query, filter_by, resource, filter_range = '')
    @query = query
    @filter_by = filter_by
    @resource = resource
    @filter_range = filter_range
  end

  def call
    search_for_results
  end

  private

  def search_for_results
    return results_all if query.size < 3
    return results_filter_by_uuid if filter_by == 'uuid'
    return results_filter_with_naming if filter_by == 'name' || filter_by == 'title'
    return results_filter_with_range if filter_by == 'game_progress'
  end

  def results_all
    resource.all
  end

  def results_filter_by_uuid
    resource.where("#{filter_by}": query)
  end

  def results_filter_with_naming
    resource.where("#{filter_by} like ?", query.to_s)
  end

  def results_filter_with_range
    resource.where("#{filter_by} #{filter_range} ?", query.to_i)
  end
end
