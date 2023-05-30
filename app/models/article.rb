# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :nullify

  has_rich_text :content
end
