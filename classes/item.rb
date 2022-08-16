class Item
  attr_accessor :publish_date, :archive
  attr_reader :id

  def initialize(_publish_date, id = Random.rand(1..1000))
    @publish_date = publish_date
    @archive = false
    @id = id
  end

  def move_to_archive
    @archive = true if can_be_archive?
  end

  def can_be_archive?
    @publish_date < Date.today.year - 10
  end
end
