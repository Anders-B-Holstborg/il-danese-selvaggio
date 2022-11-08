# frozen_string_literal: true

class Comment < ApplicationRecord
  has_rich_text :content
end
