# frozen_string_literal: true

class ComputerSearchService < ApplicationService
  # rubocop:disable Rails/MissingSuper
  def initialize(params, resource)
    @query = params[:query]
    @filter_by = params[:filter_by]
    @resource = resource[:resource].computers
  end
  # rubocop:enable Rails/MissingSuper

  def call
    check_validation
    SearchService.new(@query, @filter_by, @resource).call
  end

  private

  def check_validation
    query_valid?
    filter_by_valid?
  end

  def query_valid?
    return true unless @query.nil?

    raise StandardError, message: I18n.t('user.computer.search.query_error')
  end

  def filter_by_valid?
    raise StandardError, I18n.t('user.computer.search.filter_by_empty_error') if @filter_by.nil?
    return true if @filter_by.match('name') || @filter_by.match('uuid')

    raise StandardError, I18n.t('user.computer.search.filter_by_value_error')
  end
end
