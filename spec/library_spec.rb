require './lib/author'
require './lib/book'
require './lib/library'

RSpec.describe Library do 
  it 'exists and has attributes' do
    dpl = Library.new("Denver Public Library")  

    expect(dpl).to be_a(Library)
    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  describe '#add_author' do 
    it ' adds authors and their books to the library' do 
      dpl = Library.new("Denver Public Library")  

      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      professor = charlotte_bronte.write("The Professor", "1857")    
      villette = charlotte_bronte.write("Villette", "1853")    

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    

      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)    

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])

    end
  end
end