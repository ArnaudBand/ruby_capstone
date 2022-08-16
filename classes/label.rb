class Label
  attr_reader :id, :items
  attr_accessor :color, :title

  def initialize(color, title, id = Random.rand(1..100))
    @id = id
    @color = color
    @title = title
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self unless item.class != string
  end
end
