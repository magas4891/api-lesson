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
    permitted_params = params.permit(:RequestNumber, :SequenceNumber, :RequestType,
                                     DateTimes: :ResponseDueDateTime,
                                     ServiceArea: [
                                         PrimaryServiceAreaCode: [:SACode],
                                         AdditionalServiceAreaCodes: [SACode: []]
                                     ]
    ).merge(digsite_info: { WellKnownText: params.dig(:ExcavationInfo, :DigsiteInfo, :WellKnownText) }
    ).merge(excavator_attributes: excavator_params)
  end

  def excavator_params
    permitted_params = params.permit(Excavator: %i[CompanyName CrewOnsite])
    permitted_params['Excavator'][:Address] = { Address: params['Excavator']['Address'],
                                                City: params['Excavator']['City'],
                                                State: params['Excavator']['State'],
                                                Zip: params['Excavator']['Zip']
    }
    permitted_params
  end

end
