class AddEndTimeToGarage < ActiveRecord::Migration
  def change
    add_column :garages, :end_time, :string
  end
end
