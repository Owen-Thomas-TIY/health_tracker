class HomeController < ApplicationController
  def home
    @day = Day.where(date: Date.today).first_or_create!
    @calories_burned = @day.calories_burned
    @calories_consumed = @day.calories_consumed
    @net_calories =(@calories_consumed.blank? || @calories_burned.blank?) ? 0 : (@day.calories_consumed - @day.calories_burned)

  end
end
