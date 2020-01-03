class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all

    render json: @tickets
  end

  # GET /tickets/1
  def show
    @geo = @ticket["digsite_info"]["WellKnownText"]
    p "*"*50
    pp @geo
    p "*"*50
    @excavator = @ticket.excavator
    p "*"*50
    #reg_coordinates = /\((?<points>(\-?\d+(\.\d+)?\s\-?\d+(\.\d+)?(\,)?)+)/
    #render json: @ticket
    render :tickets => 'show'
  end

  # POST /tickets
  def create

  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

end
