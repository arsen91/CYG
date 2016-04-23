class RemoveUserIdFromJournals < ActiveRecord::Migration
  def change
    remove_column :journals, :user_id, :integer
  end
end
