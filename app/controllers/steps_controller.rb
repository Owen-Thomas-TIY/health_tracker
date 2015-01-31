class StepsController < ApplicationController
before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
    @steps = Step.all
  end

  def new
    @step = Step.new
    @day = Day.new
  end

  def show
  end

  def edit
    @day = @step.day
  end

  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'steps were successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @step.update(calorie_params)
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    date = Date.new(params[:day]["date(1i)"].to_i,params[:day]["date(2i)"].to_i,params[:day]["date(3i)"].to_i)
    @day = Day.where(date: Date.today).first_or_create!
    @step = Step.new(calorie_params)
    @step.day_id = @day.id
    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'Steps were successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def step_params
    params.require(:step).permit(:day_id, :step)
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def set_day
    @day = Day.find(params[:day_id])
  end
end
