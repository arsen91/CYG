class ChangeDefaultScoreInRatings < ActiveRecord::Migration
  def change
    change_column :ratings, :score, :integer, default: 1 
  end
end
