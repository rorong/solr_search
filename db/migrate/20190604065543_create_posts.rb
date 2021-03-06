# frozen_string_literal: true

# Post table with attributes
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :body

      t.timestamps
    end
  end
end
