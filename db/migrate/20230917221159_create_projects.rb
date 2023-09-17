# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer :start_year, null: false
      t.integer :end_year
      t.string :title, null: false
      t.string :organization, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
