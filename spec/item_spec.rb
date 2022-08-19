require 'date'
require_relative '../classes/item'

describe Item do
  describe '#move_to_archive' do
    it 'should give the date' do
      date = Date.new(2021, 8, 27)
      item = Item.new(date)

      expect(item).to be_instance_of(Item)
    end

    it 'Should set the item attribute archive to true when has been published 10 years ago' do
      date = Date.new(2001, 8, 27)

      item = Item.new(date)

      expect(item.archive).to be false
      item.move_to_archive
      expect(item.archive).to be true
    end

    it 'Should set archive to false for items when is not make 10 years old' do
      date = Date.today

      item = Item.new(date)

      expect(item.archive).to be false
      item.move_to_archive
      expect(item.archive).to be false
    end
  end
end
