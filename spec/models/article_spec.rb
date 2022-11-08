require 'rails_helper'

RSpec.describe Article do
  subject(:article) { described_class.new({ title:, subtitle:, summary:, content: }) }

  let(:title) { 'The Greatest Olive Oil' }
  let(:subtitle) { "How 'Agro' continues to elude me" }
  let(:summary) { 'I had the most ridiculous olive oil at a lunch chain. I still cannot find it in any shop.' }

  let(:content) do
    'Insert Lorem Ipsum with formatting once relevant. For now this will do to express my love for this Agro olive oil.'
  end

  let(:content_action_text_attributes) do
    {
      'id' => nil,
      'name' => 'content',
      'body' => 'Insert Lorem Ipsum with formatting once relevant. For now this will do to express my love for this Agro olive oil.',
      'record_type' => 'Article',
      'record_id' => nil,
      'created_at' => nil,
      'updated_at' => nil
    }
  end

  describe 'fields' do
    describe 'basic fields' do
      it 'responds correctly when invoking title, subtitle and summary fields' do
        expect(article.title).to eql(title)
        expect(article.subtitle).to eql(subtitle)
        expect(article.summary).to eql(summary)
      end
    end

    describe 'complex fields' do
      it "formats and displays the content field's body as a rich text field" do
        expect(article.content.to_plain_text).to eql(content)
        expect(article.content.as_json).to eql(content_action_text_attributes)
      end

      # it 'has an optional thumbnail image associated' do
      #   thumbnail =
      #   expect(article.thumbnail).to eql(thumbnail)
      # end
    end
  end
end
