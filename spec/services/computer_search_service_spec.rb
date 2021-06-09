# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ComputerSearchService, type: :service do
  describe '#call' do
    let(:subject) { described_class.call(params, resource) }
    let(:resource) do
      {
        resource: user
      }
    end
    let(:user) { create(:user, computers: [computer]) }
    let(:computer) { create(:computer) }

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

      context 'when all params are valid and filter_by name' do
        let(:computer) { create(:computer, name: 'valid') }
        let(:params) do
          {
            query: 'valid',
            filter_by: 'name'
          }
        end

        it { expect(subject.first).to eq(computer) }
      end

      context 'when all params are valid and filter_by uuid' do
        let(:computer) { create(:computer, uuid: SecureRandom.uuid) }
        let(:params) do
          {
            query: computer.uuid,
            filter_by: 'uuid'
          }
        end

        it { expect(subject.first).to eq(computer) }
      end
    end
  end
end
