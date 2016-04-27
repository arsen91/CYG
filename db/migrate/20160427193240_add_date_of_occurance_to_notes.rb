class AddDateOfOccuranceToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :date_of_occurance, :date
  end
end
