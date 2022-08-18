require_relative '../classes/book'

describe Book do
  describe 'Move_to_archive' do
    it 'returns child of Item' do
      publish_date = Date.new(2011, 3, 4)
      book = Book.new(publish_date, 'Ronald Legrand', 'bad')

      expect(book).to be_kind_of(Item)
    end

    it 'returns instance of Book' do
      publish_date = Date.new(2011, 3, 4)
      book = Book.new(publish_date, 'Ronald Legrand', 'bad')

      expect(book).to be_instance_of(Book)
    end

    it 'A book which has been published 10 years ago, cover became bad, and archive became true' do
      publish_date = Date.new(2011, 3, 4)
      book = Book.new(publish_date, 'Ronald Legrand', 'bad')

      expect(book.archive).to be false
      book.move_to_archive

      expect(book.archive).to be true
    end

    it "A book which has been published soon or less than 10 years, won't be archive, and cover remain good" do
      publish_date = Date.new(2022, 3, 4)
      book = Book.new(publish_date, 'Ronald Legrand', 'good')

      expect(book.archive).to be false
      book.move_to_archive

      expect(book.archive).to be false
    end
  end
end
