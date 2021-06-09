# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameSearchService, type: :service do
  describe '#call' do
    let(:subject) { described_class.call(params, resource) }
    let(:resource) do
      {
        resource: user
      }
    end
    let(:user) { create(:user, games: [game]) }
    let(:game) { create(:game) }

    context 'check_validation' do
      context 'when query param is not declared' do
        let(:params) do
          {
            invalid: 'invalid'
          }
        end

        it { expect { subject }.to raise_error(StandardError) }
      end

      context 'when filter_by param is not declared' do
        let(:params) do
          {
            query: 'query',
            invalid: 'invalid'
          }
        end

        it { expect { subject }.to raise_error(StandardError) }
      end

      context 'when filter_by param is declared but the value is invalid' do
        let(:params) do
          {
            query: 'query',
            filter_by: 'invalid'
          }
        end

        it { expect { subject }.to raise_error(StandardError) }
      end

      context 'when filter_by is declared as game_progress' do
        let(:params) do
          {
            query: 'query',
            filter_by: 'game_progress',
            invalid: 'invalid'
          }
        end

        it { expect { subject }.to raise_error(StandardError) }
      end

      context 'when all params are valid and filter_by title' do
        let(:game) { create(:game, title: 'valid') }
        let(:params) do
          {
            query: 'valid',
            filter_by: 'title'
          }
        end

        it { expect(subject.first).to eq(game) }
      end

      context 'when all params are valid and filter_by game_progress' do
        let(:game) { create(:game, title: 'valid', game_progress: 0) }
        let(:params) do
          {
            query: 'valid',
            filter_by: 'game_progress',
            filter_range: 'equal'
          }
        end

        it { expect(subject.first).to eq(game) }
      end
    end
  end
end
