# frozen_string_literal: true

class Excavator < ApplicationRecord
  belongs_to :ticket
  validates_presence_of :company_name, :crew_on_site, :address

  alias_attribute(:CrewOnsite, :crew_on_site)
  alias_attribute(:CompanyName, :company_name)
end
