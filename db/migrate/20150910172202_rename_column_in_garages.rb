class RenameColumnInGarages < ActiveRecord::Migration
  def change
  	rename_column :garages, :adress, :address
  end
end
