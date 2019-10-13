# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :description
      t.date :reported_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
