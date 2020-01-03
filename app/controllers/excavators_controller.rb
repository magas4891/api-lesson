class ExcavatorsController < ApplicationController
  before_action :set_excavator, only: [:show, :update, :destroy]

  # GET /excavators
  def index
    @excavators = Excavator.all

    render json: @excavators
  end

  # GET /excavators/1
  def show
    render json: @excavator
  end

  # POST /excavators
  def create

  end

  # PATCH/PUT /excavators/1
  def update
    if @excavator.update(excavator_params)
      render json: @excavator
    else
      render json: @excavator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /excavators/1
  def destroy
    @excavator.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_excavator
    @excavator = Excavator.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.

end
