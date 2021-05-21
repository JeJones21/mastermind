class Code
  attr_reader :colors,
              :sequence

  def initialize(colors)
    @colors = colors
    @sequence = []
  end

  def sequencer
    4.times { @sequence << colors.sample }
  end
end
