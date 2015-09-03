class CreateGarages < ActiveRecord::Migration
  def change
    create_table :garages do |t|
    	t.string :name, null: false
    	t.string :adress, null: false
    	t.float :latitude, null: false
    	t.float :longitude, null: false
    	t.float :rating
    	t.float :average_cost
    	t.comments, commentd
    	# add car column also.. 
      t.timestamps null: false
    end
  end
end
