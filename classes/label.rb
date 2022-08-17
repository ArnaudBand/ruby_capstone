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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [color, title]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
