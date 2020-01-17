# frozen_string_literal: true

RSpec.describe Ticket, type: :model do
  let!(:ticket) { create(:valid_ticket) }

  context 'validation' do
    %i[request_number
       sequence_number
       request_type
       date_times
       service_area
       digsite_info].each do |field|
      it { is_expected.to validate_presence_of(:"#{field}") }
    end
  end

  context 'assotiation' do
    it { is_expected.to have_one(:excavator) }
  end

  context 'creating' do
    it 'be valid with valid attributes' do
      expect(ticket).to be_valid
    end

    %i[request_number
       sequence_number
       request_type
       date_times
       service_area
       digsite_info].each do |invalid_attribute|
      it "be invalid without #{invalid_attribute}" do
        expect(build(:valid_ticket, "#{invalid_attribute}": nil)).to_not be_valid
      end
    end
  end

  context 'deleting' do
    it 'count of tickets became less on 1' do
      expect { ticket.destroy }.to change { Ticket.count }.by(-1)
    end
  end

  context 'accept_nested_attributes' do
    it { should accept_nested_attributes_for(:excavator) }
    it do
      should accept_nested_attributes_for(:excavator)
        .allow_destroy(true)
    end
  end
end
