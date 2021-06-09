# frozen_string_literal: true

class GameSearchService < ApplicationService
  def initialize(params, resource)
    @query = params[:query]
    @filter_by = params[:filter_by]
    @filter_range = params[:filter_range]
    @resource = resource[:resource].games
  end

  def call
    check_validation
    SearchService.new(@query, @filter_by, @resource, @filter_range).call
  end

  private

  def check_validation
    query_valid?
    filter_by_valid?
    filter_range_valid?
    convert_to_sql_filter_range if filter_range_valid?
  end

  def query_valid?
    return true unless @query.nil?

    raise StandardError, I18n.t('user.game.search.query_error')
  end

  def filter_by_valid?
    raise StandardError, I18n.t('user.game.search.filter_by_empty_error') if @filter_by.nil?
    return true if @filter_by.match('title') || @filter_by.match('game_progress')

    raise StandardError, I18n.t('user.game.search.filter_by_value_error')
  end

  def filter_range_valid?
    return true unless @filter_by.match('game_progress')

    raise StandardError, I18n.t('user.game.search.filter_range_empty_error') if @filter_range.nil?
    return true if @filter_range.match('less_or_equal') || @filter_range.match('equal') || @filter_range.match('more_or_equal')

    raise StandardError, I18n.t('user.game.search.filter_range_value_error')
  end

  def convert_to_sql_filter_range
    case @filter_range
    when 'less_or_equal'
      @filter_range = '<='
    when 'equal'
      @filter_range = '='
    when 'more_or_equal'
      @filter_range = '>='
    end
  end
end
