require 'rails_helper'

RSpec.describe User do
  subject(:user) { described_class.new({ first_name:, last_name:, nick_name:, email: }) }

  let(:first_name) { 'Amy' }
  let(:last_name) { 'Lee' }
  let(:nick_name) { 'Lilith' }
  let(:email) { 'my@immortal.it' }

  describe 'fields' do
    describe 'basic attributes' do
      it 'responds correctly when invoking first name, last name, nick name and email fields' do
        expect(user.first_name).to eql(first_name)
        expect(user.last_name).to eql(last_name)
        expect(user.nick_name).to eql(nick_name)
        expect(user.email).to eql(email)
      end
    end

    describe '#first_name' do
      it { is_expected.to validate_presence_of(:first_name) }
    end

    describe '#last_name, #nick_name' do
      it { is_expected.not_to validate_presence_of(:last_name) }
      it { is_expected.not_to validate_presence_of(:nick_name) }
    end

    describe '#email' do
      it { is_expected.not_to allow_value('blah').for(:email) }
      it { is_expected.to allow_value('a@b.com').for(:email) }
    end
  end
end
