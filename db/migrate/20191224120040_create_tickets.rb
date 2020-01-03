class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.integer :sequence_number
      t.string :request_type
      t.json :date_times
      t.json :service_area
      t.json :digsite_info

      t.timestamps
    end
  end
end
