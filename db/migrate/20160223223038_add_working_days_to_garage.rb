class AddWorkingDaysToGarage < ActiveRecord::Migration
  def change
    add_column :garages, :working_days, :string
  end
end
