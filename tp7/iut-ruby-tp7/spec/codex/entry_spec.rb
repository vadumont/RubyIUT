require 'spec_helper'

describe Codex::Entry do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      id: id,
      date: date,
      content: content
    }
  end

  let(:id) do
    4242
  end

  let(:date) do
    DateTime.now
  end

  let(:content) do
    'Tu es un gros totoro !'
  end

  describe '#date' do
	context 'when the date given is DateTime' do
		it 'returns the right date' do
		expect(subject.date).to eq date
		end
    end
    context 'when the date given is a String' do
		let(:date) do
			"24/02/2015"
		end
		
		it 'returns a right date' do
			expect(subject.date).to eq DateTime.new(2015,02,24)
		end
    end
  end

  describe '#content' do
    it 'returns the right content' do
      expect(subject.content).to eq content
    end
  end
end
