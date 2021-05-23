require './lib/code'
require './lib/evaluator'

RSpec.describe Evaluator do
  describe '#initialize' do
    it 'exists' do
      code = Code.new
      evaluator = Evaluator.new(code)

      expect(evaluator).to be_an_instance_of(Evaluator)
    end

    it 'has a secret code to compare to' do
      code = Code.new
      code.secret_code = code.generate
      guess = ['G', 'G', 'R', 'Y']
      evaluator = Evaluator.new(code)

      expect(evaluator.code.secret_code.length).to eq(4)
      expect(evaluator.code).to be_an_instance_of(Code)
    end
  end

  describe 'evaluaton process' do
    it '#transform_guess' do
      code = Code.new
      code.generate
      evaluator = Evaluator.new(code)
      evaluator.transform_guess('GGRY')

      expect(evaluator.guess).to match_array(['G', 'G', 'R', 'Y'])
    end

    it 'evaluates placement' do
      code = Code.new
      allow(code).to receive(:generate).and_return(['G', 'Y', 'B', 'Y'])
      code.secret_code = code.generate
      evaluator = Evaluator.new(code)
      evaluator.transform_guess('GGRY')

      expect(evaluator.placement).to eq("You have 2 colors in the correct position!")
    end

    it 'evaluates colors' do
      code = Code.new
      allow(code).to receive(:generate).and_return(['Y', 'Y', 'G', 'Y'])
      code.secret_code = code.generate
      evaluator = Evaluator.new(code)
      evaluator.transform_guess('GBRY')

      expect(evaluator.correct_color).to eq("You have guessed 2 correct colors!")
    end

    it 'can tell when a guess is the correct length' do
      code = Code.new
      allow(code).to receive(:generate).and_return(['Y', 'Y', 'G', 'Y'])
      code.secret_code = code.generate
      evaluator = Evaluator.new(code)
      evaluator.transform_guess('GBRY')

      expect(evaluator.correct_length).to eq(true)
    end

    it 'can tell player when their guess is too long' do
      code = Code.new
      allow(code).to receive(:generate).and_return(['Y', 'Y', 'G', 'Y'])
      code.secret_code = code.generate
      evaluator = Evaluator.new(code)
      evaluator.transform_guess('GBRYY')

      expect(evaluator.correct_length).to eq("Oops! Your guess is too long. Please try again.")
    end

    it 'can tell player when their guess is too short' do
      code = Code.new
      allow(code).to receive(:generate).and_return(['Y', 'Y', 'G', 'Y'])
      code.secret_code = code.generate
      evaluator = Evaluator.new(code)
      evaluator.transform_guess('GBR')

      expect(evaluator.correct_length).to eq("Oops! Your guess is too short. Please try again.")
    end

    it 'can alert player when they have guessed correctly' do
      code = Code.new
      allow(code).to receive(:generate).and_return(['R', 'B', 'B', 'Y'])
      code.secret_code = code.generate
      evaluator = Evaluator.new(code)
      evaluator.transform_guess('RBBY')

      expect(evaluator.correct_guess).to eq("WE HAVE A WINNER! Congratulations, you've guessed the secret code!")
    end
  end
end
