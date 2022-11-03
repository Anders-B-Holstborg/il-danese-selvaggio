require 'rails_helper'

RSpec.describe User, type: :model do
  let(:first_name) { 'Amy' }
  let(:last_name) { 'Lee' }
  let(:nick_name) { 'Lilith' }
  let(:email) { 'my@immortal.it' }

  subject { described_class.new({ first_name:, last_name:, nick_name:, email: }) }

  describe 'fields' do
    describe 'basic attributes' do
      it 'should have first name, last name, nick_name and email fields' do
        expect(subject.first_name).to eql(first_name)
        expect(subject.last_name).to eql(last_name)
        expect(subject.nick_name).to eql(nick_name)
        expect(subject.email).to eql(email)
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
      it { is_expected.to_not allow_value('blah').for(:email) }
      it { is_expected.to allow_value('a@b.com').for(:email) }
    end
  end

  describe 'relations' do
    # it { is_expected.to have_many(:articles).dependent(:nullify) }
    # it { is_expected.to have_many(:comments).dependent(:nullify) }
  end
end
