class Calorie < ActiveRecord::Base
belongs_to :day
  def self.total
      day = Day.where(date: Date.today)
      total = 0
      calorie_array = []
      Calorie.where(day_id: day.id).all.each do |calorie|
        calorie_array << calorie.calorie
      end
      total = calorie_array.reduce(:+)
      return total
  end
end
