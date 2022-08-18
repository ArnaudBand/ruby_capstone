class Item
  attr_accessor :publish_date, :archive, :label
  attr_reader :id

  def initialize(publish_date, id = Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archive = false
  end

  def move_to_archive
    @archive = true if can_be_archive?
  end

  def add_label
    @label = label
  end

  def can_be_archive?
    (Date.today << 120 <=> @publish_date).positive?
  end
end
