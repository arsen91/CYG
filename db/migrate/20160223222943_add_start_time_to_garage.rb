class AddStartTimeToGarage < ActiveRecord::Migration
  def change
    add_column :garages, :start_time, :string
  end
end
