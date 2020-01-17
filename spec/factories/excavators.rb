# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    factory :valid_excavator do
      company_name { 'John Doe CONSTRUCTION' }
      address do
        {
          'Address': '555 Some RD',
          'City': 'SOME PARK',
          'State': 'ZZ',
          'Zip': '55555'
        }
      end
      crew_on_site { true }
      ticket_id { Ticket.last.id }
    end
  end
end
