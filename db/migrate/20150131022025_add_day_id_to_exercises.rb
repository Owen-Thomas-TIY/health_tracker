class AddDayIdToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :day, index: true
    add_foreign_key :exercises, :days
  end
end
