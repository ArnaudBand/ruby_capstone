require 'date'
require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :publish_date, :id

  def initialize(publish_date, publisher, cover_state, id = Random.rand(1..1000))
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [publish_date, publisher, cover_state, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end

  private

  def can_be_archived?
    @publish_date.to_date.year < Date.today.year - 10 || @cover_state == 'bad'
  end
end
