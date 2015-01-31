class AddDayIdToStep < ActiveRecord::Migration
  def change
    add_reference :steps, :day, index: true
    add_foreign_key :steps, :days
  end
end
