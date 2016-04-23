class AddCarIdToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :car_id, :integer
  end
end
