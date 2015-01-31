class ExercisesController < ApplicationController
before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    @day = Day.new
  end

  def show
  end

  def edit
    @day = @exercise.day
  end

  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: 'exercises were successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: 'exercises was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    date = Date.new(params[:day]["date(1i)"].to_i,params[:day]["date(2i)"].to_i,params[:day]["date(3i)"].to_i)
    @day = Day.where(date: Date.today).first_or_create!
    @exercise = Exercise.new(exercise_params)
    @exercise.day_id = @day.id
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'exercises were successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def exercise_params
    params.require(:exercise).permit(:day_id, :exercise)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_day
    @day = Day.find(params[:day_id])
  end
end
