class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :weights, :entered_on
    remove_column :steps, :entered_on
    remove_column :exercises, :entered_on
    remove_column :calories, :entered_on
  end
end
