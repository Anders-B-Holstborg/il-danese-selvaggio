# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:first_name) { 'Amy' }
  let(:last_name) { 'Lee' }
  let(:nickname) { 'Lilith' }
  let(:email) { 'my@immortal.it' }
  let(:user) { User.new({ first_name:, last_name:, nickname:, email: }) }

  describe 'basic attributes' do
    it 'should have first name, last name, nickname and email fields' do
      expect(user.first_name).to eql(first_name)
      expect(user.last_name).to eql(last_name)
      expect(user.nickname).to eql(nickname)
      expect(user.email).to eql(email)
    end
  end

  # describe '#first_name' do
  #   it { is_expected_to validate_presence_of(:first_name) }
  # end

  # describe '#last_name' do
  #   it { is_expected_not_to validate_presence_of(:last_name) }
  # end

  # describe '#email' do
  #   it { is_expected_to_not allow_value('blah').for(:email) }
  #   it { is_expected_to allow_value('a@b.com').for(:email) }
  # end
end
