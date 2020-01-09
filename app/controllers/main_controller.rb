# frozen_string_literal: true

class MainController < ApplicationController
  def create
    ticket = Ticket.new(ticket_params)
    if ticket.save
      render json: ticket, status: :created, location: ticket
    else
      render json: ticket.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def ticket_params
    params.permit(
        :RequestNumber, :SequenceNumber, :RequestType,
         DateTimes: :ResponseDueDateTime,
         ServiceArea: [
             PrimaryServiceAreaCode: [:SACode],
             AdditionalServiceAreaCodes: [SACode: []]
         ]).merge(
        digsite_info: { WellKnownText: params.dig(
        :ExcavationInfo, :DigsiteInfo, :WellKnownText)
        }).merge(excavator_attributes: excavator_params)
  end

  def excavator_params
    permit_params = params.require(:Excavator).permit( :CompanyName,
                                                       :CrewOnsite)
    permit_params['address'] = {
          Address: params['Excavator']['Address'],
          City: params['Excavator']['City'],
          State: params['Excavator']['State'],
          Zip: params['Excavator']['Zip']
       }
    permit_params
  end
end
