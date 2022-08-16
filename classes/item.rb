class Item
  attr_accessor :published_date, :archive
  attr_reader :id

  def initialize(_published_date, id = Random.rand(1..1000))
    @published_date = published_date
    @archive = false
    @id = id
  end
end
