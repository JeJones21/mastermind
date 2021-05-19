require './lib/color'
require './lib/sequence'

RSpec.describe Sequence do
  describe '#initialize' do
    it 'exists' do
      red = Color.new("Red")
      green = Color.new("Green")
      blue = Color.new("Blue")
      yellow = Color.new("Yellow")

      sequence = Sequence.new([red, green, blue, yellow])

      expect(sequence).to be_an_instance_of(Sequence)
    end
  end
end
