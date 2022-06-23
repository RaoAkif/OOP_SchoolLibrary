require './rental'
require './book'
require './person'

describe Rental do
  it 'should have a date' do
    person = Person.new('18', 'John', parent_permission: true)
    rental = Rental.new('2018-01-01', Book.new('The Great Gatsby', 'F. Scott Fitzgerald'), person)
    expect(rental.date).to eq('2018-01-01')
  end

  it 'should have a book' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    rental = Rental.new('2018-01-01', book, Person.new('18', 'John', parent_permission: true))
    expect(rental.book).to eq(book)
  end

  it 'should have a person' do
    person = Person.new('18', 'John', parent_permission: true)
    rental = Rental.new('2018-01-01', Book.new('The Great Gatsby', 'F. Scott Fitzgerald'), person)
    expect(rental.person).to eq(person)
  end
end
