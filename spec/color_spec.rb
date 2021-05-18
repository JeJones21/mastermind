require './lib/color'

RSpec.describe Color do
  describe '#initialize' do
    it 'exists' do
      color = Color.new("Red")

      expect(color).to be_an_instance_of(Color)
    end

    it 'can have a name' do
     color = Color.new("Red")

     expect(color.name).to eq("Red")
    end
  end

  describe 'multiple colors' do
    it 'can have another name' do
     color = Color.new("Green")

     expect(color.name).to eq("Green")
    end
  end
end
