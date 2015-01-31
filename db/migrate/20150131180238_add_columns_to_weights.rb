class AddColumnsToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :age, :integer
    add_column :weights, :height, :integer
  end
end
