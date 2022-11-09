# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment do
  subject(:comment) { described_class.new({ content: }) }

  let(:content) do
    'Perhaps the Agro is the name of the brand, but a type of oil? I would visit the place and pick up a pack of oil from them.'
  end

  let(:content_action_text_attributes) do
    {
      'id' => nil,
      'name' => 'content',
      'body' => 'Perhaps the Agro is the name of the brand, but a type of oil? I would visit the place and pick up a pack of oil from them.',
      'record_type' => 'Comment',
      'record_id' => nil,
      'created_at' => nil,
      'updated_at' => nil
    }
  end

  describe 'content field' do
    it "formats and displays the content field's body as a rich text field" do
      expect(comment.content.to_plain_text).to eql(content)
      expect(comment.content.as_json).to eql(content_action_text_attributes)
    end
  end

  describe 'relations' do
    it 'cannot exist without an associated user or article' do
      user = create(:user)
      article = create(:article, user:)

      expect { described_class.create!(user:) }.to raise_error('Validation failed: Article must exist')
      expect { described_class.create!(article:) }.to raise_error('Validation failed: User must exist')
      expect(described_class.create!(user:, article:)).to be_truthy
    end
  end
end
