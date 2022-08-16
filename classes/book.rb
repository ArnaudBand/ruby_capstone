require 'date'
require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :publish_date

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    @publish_date.to_date.year < Date.today.year - 10 || @cover_state == 'bad'
  end
end
