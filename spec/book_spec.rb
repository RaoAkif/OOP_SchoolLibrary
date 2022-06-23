require './store'
require './book'

describe Book do
  it 'should have a title' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    expect(book.title).to eq('The Great Gatsby')
  end

  it 'should have an author' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    expect(book.author).to eq('F. Scott Fitzgerald')
  end

  it 'should have a list of rentals' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    expect(book.rentals).to eq([])
  end
end
