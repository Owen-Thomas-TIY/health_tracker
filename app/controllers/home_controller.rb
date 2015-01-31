class HomeController < ApplicationController
  def home
    @day = Day.where(date: Date.today).first_or_create!
    @calories_burned = @day.calories_burned
    @calories_consumed = @day.calories_consumed
    @net_calories =(@calories_consumed.blank? || @calories_burned.blank?) ? 0 : (@day.calories_consumed - @day.calories_burned)
    @bmr =(@day.weight.blank?) ? 0 : (66 + ( 6.23 * @day.weight.weight ) + ( 12.7 * @day.weight.height ) - ( 6.8 * @day.weight.age ))
    @all_days = Day.all
    #loss = []
    #@all_days.each do |day|
    #  loss << @bmr - day.net_calories
    #end
    #total_loss = loss.reduce[:+]
    #@final_loss = (total_loss/3500)
  end
end
