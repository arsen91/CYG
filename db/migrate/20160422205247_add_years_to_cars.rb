class AddYearsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :integer, :string
  end
end
