class RemoveIntegerFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :integer, :string
  end
end
