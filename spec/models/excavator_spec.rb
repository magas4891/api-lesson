# frozen_string_literal: true

RSpec.describe Excavator, type: :model do
  let!(:ticket) { create(:valid_ticket) }
  let!(:excavator) { create(:valid_excavator) }

  context 'validation' do
    %i[company_name
       address
       crew_on_site].each do |field|
      it { is_expected.to validate_presence_of(:"#{field}") }
    end
  end

  context 'assotiation' do
    it { is_expected.to belong_to(:ticket) }
  end
end
