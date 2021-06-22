# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator, type: :decorator do
  describe '#greeting' do
    subject { user.decorate.greeting }

    context 'when user have first and last name' do
      let(:user) { create(:user, first_name: 'Valid', last_name: 'Test') }

      it 'greetings with user full name' do
        expect(subject).to eq('Hi, Valid Test')
      end
    end

    context 'when user does not have both first and last name' do
      let(:user) { create(:user, email: 'valid@test.com') }

      it 'greetings with an user email' do
        expect(subject).to eq('Hi, valid@test.com')
      end
    end
  end
end
