class AddDayIdToCalorie < ActiveRecord::Migration
  def change
    add_reference :calories, :day, index: true
    add_foreign_key :calories, :days
  end
end
