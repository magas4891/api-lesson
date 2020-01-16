# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  validates_associated :excavator
  validates_presence_of :request_number, :sequence_number, :request_type,
                        :date_times, :service_area, :digsite_info

  alias_attribute(:RequestNumber, :request_number)
  alias_attribute(:SequenceNumber, :sequence_number)
  alias_attribute(:RequestType, :request_type)
  alias_attribute(:DateTimes, :date_times)
  alias_attribute(:ServiceArea, :service_area)
  alias_attribute(:ExcavationInfo, :digsite_info)

  accepts_nested_attributes_for :excavator
end
