require 'CSVSorter'

RSpec.describe CSVSorter::Methods do
  subject { CSVSorter::Methods.new }

  describe '.sort_last_first' do
    let(:unsorted_csv) { CSV.parse(File.read('spec\unsorted.csv'), headers: true) }
    let(:sorted_csv) { CSV.parse(File.read('spec\sorted.csv'), headers: true) }

    it 'returns a sorted array' do
      expect(subject.sort_last_first(unsorted_csv).map(&:to_h)).to eq(sorted_csv.map(&:to_h))
    end
  end
end
