class Code
  attr_reader :colors,
              :sequence

  def initialize(colors)
    @colors = colors
    @sequence = []
  end
end
