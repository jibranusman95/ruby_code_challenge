require 'spec_helper'
require './app/services/orderer.rb'

RSpec.describe ::Orderer do
  context 'with orderable strings' do
    it 'ordering is done successfully' do
      input_1 = ['bca', 'aaa', 'acb']

      results = described_class.new(input_strings: input_1).determine_order
      expect(results.class).to eq Array
      expect(results.join('')).to eq 'bac'

      input_2 = ['b', 'aa', 'ac']

      results = described_class.new(input_strings: input_2).determine_order
      expect(results.class).to eq Array
      expect(results.join('')).to eq 'bac'

      input_3 = ['wcz', 'cc', 'cz']

      results = described_class.new(input_strings: input_3).determine_order
      expect(results.class).to eq Array
      expect(results.join('')).to eq 'wcz'
    end
  end

  context 'with unorderable strings' do
    it 'ordering is done unsuccessfully' do
      input_1 = ['bcas', 'aaaa', 'acbd']

      results = described_class.new(input_strings: input_1).determine_order
      expect(results.class).to eq String
      expect(results).to eq 'Insufficient Information'

      input_2 = ['wb', 'aaa', 'ac']

      results = described_class.new(input_strings: input_2).determine_order
      expect(results.class).to eq String
      expect(results).to eq 'Insufficient Information'

      input_3 = ['wcz', 'ccx', 'czx']

      results = described_class.new(input_strings: input_3).determine_order
      expect(results.class).to eq String
      expect(results).to eq 'Insufficient Information'
    end
  end
end
