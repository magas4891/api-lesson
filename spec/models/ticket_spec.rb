# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let!(:ticket) { create(:valid_ticket) }

  context 'validation' do
    it { is_expected.to validate_presence_of(:request_number) }
    it { is_expected.to validate_presence_of(:sequence_number) }
    it { is_expected.to validate_presence_of(:request_type) }
    it { is_expected.to validate_presence_of(:date_times) }
    it { is_expected.to validate_presence_of(:service_area) }
    it { is_expected.to validate_presence_of(:digsite_info) }
  end

  context 'assotiation' do
    it { is_expected.to have_one(:excavator) }
  end

  context 'creating' do
    it 'be valid with valid attributes' do
      expect(ticket).to be_valid
    end
    it 'be valid with valid attributes' do
      expect(build(:valid_ticket, sequence_number: nil)).to_not be_valid
    end
  end

  context 'deleting' do
    it 'count of tickets became less on 1' do
      expect { ticket.destroy }.to change { Ticket.count }.by(-1)
    end
  end
end
