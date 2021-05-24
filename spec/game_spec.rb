require './lib/code'
require './lib/evaluator'
require './lib/game'

RSpec.describe Game do
  describe '#initialize' do
    it 'exists' do
      game = Game.new

      expect(game).to be_an_instance_of(Game)
    end

    it 'is initialized with a code' do
      code = Code.new
      game = Game.new

      expect(game.code).to be_an_instance_of(Code)
    end

    it 'is initialized with an evaluator' do
      code = Code.new
      evaluator = Evaluator.new(code)
      game = Game.new

      expect(game.evaluator).to be_an_instance_of(Evaluator)
    end
  end
end
