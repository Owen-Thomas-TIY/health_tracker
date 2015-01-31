class WeightsController < ApplicationController
#before_action :set_day
before_action :set_weight, only: [:show, :edit, :update, :destroy]

  # GET /weights
  # GET /weights.json
  def index
    @weights = Weight.all
  end

  # GET /weights/1
  # GET /weights/1.json
  def show
  end

  # GET /weights/new
  def new
    @weight = Weight.new
    @day = Day.new
  end

  # GET /weights/1/edit
  def edit
    @day = @weight.day
  end

  # POST /weights
  # POST /weights.json
  def create
    date = Date.new(params[:day]["date(1i)"].to_i,params[:day]["date(2i)"].to_i,params[:day]["date(3i)"].to_i)
    @day = Day.where(date: Date.today).first_or_create!
    @weight = Weight.new(weight_params)
    @weight.day_id = @day.id
    respond_to do |format|
      if @weight.save
        format.html { redirect_to @weight, notice: 'Weight was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /weights/1
  # PATCH/PUT /weights/1.json
  def update
    respond_to do |format|
      if @weight.update(weight_params)
        format.html { redirect_to @weight, notice: 'Weight was successfully updated.' }
        format.json { render :show, status: :ok, location: @weight }
      else
        format.html { render :edit }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.json
  def destroy
    @weight.destroy
    respond_to do |format|
      format.html { redirect_to weights_url, notice: 'Weight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight
      @weight = Weight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_params
      params.require(:weight).permit(:day_id, :weight)
    end

    def set_day
      @day = Day.find(params[:day_id])
    end
end
