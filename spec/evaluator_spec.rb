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
  end
end
