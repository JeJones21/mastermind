require './lib/code'
require './lib/evaluator'
require './lib/game'

RSpec.describe Game do
  describe '#initialize' do
    it 'exists' do
      game = Game.new

      expect(game).to be_an_instance_of(Game)
    end
  end
end
