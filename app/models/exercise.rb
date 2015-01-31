class Exercise < ActiveRecord::Base
belongs_to :day
  #"Cardio","Strength Training","Spin Class","Jazzercise","Kick-boxing"
  def self.total
      total = 0
      Exercise.where(entered_on: Date.today).all.each do |exercise|
        if exercise.exercise == "Cardio"
          total += 150
        elsif exercise.exercise == "Strength Training"
          total += 250
        elsif exercise.exercise == "Spin Class"
          total += 200
        elsif exercise.exercise == "Jazzercise"
          total += 500
        elsif exercise.exercise == "Kick-boxing"
          total += 100
        end
      end
      return total
  end

  def calories_burned
    if self.exercise == "Cardio"
      return 150
    elsif self.exercise == "Strength Training"
      return 250
    elsif self.exercise == "Spin Class"
      return 200
    elsif self.exercise == "Jazzercise"
      return 500
    elsif self.exercise == "Kick-boxing"
      return 100
    end
  end
end
