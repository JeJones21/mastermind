require './lib/code'
reuire './lib/evaluator'

RSpec.describe Evaluator do
  describe '#initialize' do
    it 'exists' do
      code = Code.new
      evaluator = Evaluator.new(code)

      expect(evaluator).to be_an_instance_of(Evaluator)
    end
  end
end
