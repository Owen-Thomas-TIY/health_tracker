class CaloriesController < ApplicationController
before_action :set_calorie, only: [:show, :edit, :update, :destroy]

  def index
    @calories = Calorie.all
  end

  def new
    @calorie = Calorie.new
    @day = Day.new
  end

  def show
  end

  def edit
    @day = @calorie.day
  end

  def destroy
    @calorie.destroy
    respond_to do |format|
      format.html { redirect_to calories_url, notice: 'calories were successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @calorie.update(calorie_params)
        format.html { redirect_to @calorie, notice: 'Calories was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    date = Date.new(params[:day]["date(1i)"].to_i,params[:day]["date(2i)"].to_i,params[:day]["date(3i)"].to_i)
    @day = Day.first_or_create(date: date)
    @calorie = Calorie.new(calorie_params)
    @calorie.day_id = @day.id
    respond_to do |format|
      if @calorie.save
        format.html { redirect_to @calorie, notice: 'calories were successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def calorie_params
    params.require(:calorie).permit(:day_id, :calorie)
  end

  def set_calorie
    @calorie = Calorie.find(params[:id])
  end

  def set_day
    @day = Day.find(params[:day_id])
  end
end
