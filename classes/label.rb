class Label
  attr_reader :id
  attr_accessor :color, :title

  def initialize(color, title, id = Random.rand(1..100))
    @id = id
    @color = color
    @title = title
  end
end
