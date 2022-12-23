require './lib/author'
require './lib/book'

RSpec.describe Author do 
  it 'exists and has attributes' do 
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})     

    expect(charlotte_bronte).to be_a(Author)
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  describe '#write' do 
    it 'can write a book and have the book put in the array of books' do 
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})     
      
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847") 

      expect(jane_eyre.class).to eq(Book)
      #have to call books.last to pass this test, otherwise themethod
      #returns an array instead of the book object..
      #better to make add_book(method)? 
      expect(jane_eyre.title).to eq("Jane Eyre")

      # charlotte_bronte.write("Villette", "1853")
      # expect(charlotte_bronte.books).to eq([jane_eyre, charlotte_bronte.write("Villette", "1853")])
     
      villette = charlotte_bronte.write("Villette", "1853")
      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end