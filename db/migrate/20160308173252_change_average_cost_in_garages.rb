class ChangeAverageCostInGarages < ActiveRecord::Migration
  def change
    change_column :garages, :average_cost, :integer 
  end
end
