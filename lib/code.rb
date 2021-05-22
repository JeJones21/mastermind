class Code
  attr_reader :colors
  attr_accessor :secret_code

  def initialize
    @colors = ['R', 'G', 'Y', 'B']
    @secret_code = []
  end

  def generate
    secret_code = []
    4.times { secret_code << colors.sample }
    return secret_code
  end
end
