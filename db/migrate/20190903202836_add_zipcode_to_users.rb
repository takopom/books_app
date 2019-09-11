# frozen_string_literal: true

class AddZipcodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :zipcode, :string
  end
end
