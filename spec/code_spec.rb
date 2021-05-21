require './lib/code'

RSpec.describe Code do
  describe '#initialize' do
    it 'exists' do
      code = Code.new(['R', 'G', 'Y', 'B'])

      expect(code).to be_an_instance_of(Code)
    end

    it 'has an array of colors' do
      code = Code.new(['R', 'G', 'Y', 'B'])

      expect(code.colors).to eq(['R', 'G', 'Y', 'B'])
    end

    it 'starts with an empty sequence' do
      code = Code.new(['R', 'G', 'Y', 'B'])

      expect(code.sequence).to eq([])
    end
  end

  describe '#sequencer' do
    it 'can generate a random sequence' do
      code = Code.new(['R', 'G', 'Y', 'B'])

      expect(code.sequencer.length).to eq(4)
      expect(code.sequencer.class).to eq(String)
    end
  end
end
