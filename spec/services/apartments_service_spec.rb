require 'rails_helper'

RSpec.describe ApartmentsService do
  include_context 'External API stubs'

  describe '#load_feed' do
    subject { described_class.load_feed }
    let(:expected) { YAML.load(file_fixture('result.yml').read) }

    it 'should get apartments feed without duplicates' do
      is_expected.to eq(expected)
    end
  end
end