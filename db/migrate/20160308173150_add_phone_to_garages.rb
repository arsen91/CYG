class AddPhoneToGarages < ActiveRecord::Migration
  def change
    add_column :garages, :phone, :string
  end
end
