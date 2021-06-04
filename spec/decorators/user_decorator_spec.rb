# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator, type: :decorator do
  describe '#greeting' do
    let(:subject) { user.decorate.greeting }

    context 'when user have first and last name' do
      let(:user) { create(:user) }

      it 'greetings with user full name' do
        expect(subject).to eq("Hi, #{user.first_name} #{user.last_name}")
      end
    end

    context 'when user does not have both first and last name' do
      let(:user) { create(:user, first_name: '', last_name: '') }

      it 'greetings with an user email' do
        expect(subject).to eq("Hi, #{user.email}")
      end
    end
  end
end
