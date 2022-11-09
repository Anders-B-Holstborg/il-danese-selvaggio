# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { described_class.new({ first_name:, last_name:, nick_name:, email:, password: }) }

  let(:first_name) { 'Amy' }
  let(:last_name) { 'Lee' }
  let(:nick_name) { 'Lilith' }
  let(:email) { 'my@immortal.it' }
  let(:password) { 'Barc3lonaDancin' }

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

  describe 'relations' do
    it 'can access the comments of its articles and the author of a given comment' do
      article = create(
        :article,
        user:,
        title: 'Why Terran plays itself',
        subtitle: 'Easiest race of my life'
      )
      commenting_user = create(:user)
      comment_one = create(:comment, user: commenting_user, article:)
      comment_two = create(:comment, user: commenting_user, article:)
      comment_three = create(:comment, user: commenting_user, article:)
      comments = [comment_one, comment_two, comment_three]

      user.update!(articles: [article])
      article.update!(comments:)

      expect(user.articles.first.comments.third).to be(comment_three)
      expect(user.articles.first.comments.second.user).to be(commenting_user)
    end
  end
end
