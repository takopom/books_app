class RenameFollowerIdColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :follower_id, :user_id
  end
end
