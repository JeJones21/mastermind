require './lib/code'

RSpec.describe Code do
  describe '#initialize' do
    it 'exists' do
      code = Code.new(['R', 'G', 'Y', 'B'])


      expect(code).to be_an_instance_of(Code)
    end
  end
end
