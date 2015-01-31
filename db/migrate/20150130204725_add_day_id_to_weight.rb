class AddDayIdToWeight < ActiveRecord::Migration
  def change
    #adds a column to the weights table associated with the day table. This will auto name as day_id.
    #Index allows SQL to use PK and FK columns to be more quickly searchable by the db. This optimizes DB load/response.
    add_reference :weights, :day, index: true
    #this tells the DB that the "day_id" column references the days table with a unique indentifier (Fk)
    add_foreign_key :weights, :days
  end
end
