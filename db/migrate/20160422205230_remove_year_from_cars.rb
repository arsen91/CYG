class RemoveYearFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :year, :datetime
  end
end
