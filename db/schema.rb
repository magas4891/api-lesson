# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20191224120110) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'excavators', force: :cascade do |t|
    t.string 'company_name'
    t.json 'address'
    t.boolean 'crew_on_site'
    t.bigint 'ticket_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_excavators_on_ticket_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'request_number'
    t.integer 'sequence_number'
    t.string 'request_type'
    t.json 'date_times'
    t.json 'service_area'
    t.json 'digsite_info'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'excavators', 'tickets'
end
