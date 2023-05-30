# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.timestamps

      t.belongs_to :user, foreign_key: true

      t.string :title
      t.string :subtitle
      t.string :summary
      t.text :content
    end
  end
end
