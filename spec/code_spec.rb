require './lib/code'

RSpec.describe Code do
  describe '#initialize' do
    it 'exists' do
      code = Code.new

      expect(code).to be_an_instance_of(Code)
    end

    it 'has an array of colors' do
      code = Code.new

      expect(code.colors).to match_array(['R', 'G', 'Y', 'B'])
    end

    it 'starts with an empty sequence' do
      code = Code.new

      expect(code.secret_code).to eq([])
    end
  end

  describe '#generate' do
    it 'can generate a random secret code' do
      code = Code.new

      secret_code = code.generate

      expect(secret_code.length).to eq(4)
      expect(secret_code.class).to eq(Array)
    end
  end
end
