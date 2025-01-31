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

  describe '#publication_time_frame_for' do 
    it 'returns a hash of the publication time frame' do 
      dpl = Library.new("Denver Public Library")  

      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      professor = charlotte_bronte.write("The Professor", "1857")    
      villette = charlotte_bronte.write("Villette", "1853")    

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    

      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee) 

      expect(dpl.start_year(charlotte_bronte)).to eq("1847")
      expect(dpl.end_year(charlotte_bronte)).to eq("1857")

      expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
    end
  end

  describe '#checkout' do 
    it 'returns true if the book can be checked out or false if it is already checked out or not in the library' do 
      dpl = Library.new("Denver Public Library")  

      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      professor = charlotte_bronte.write("The Professor", "1857")    
      villette = charlotte_bronte.write("Villette", "1853")    

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    

      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 

      expect(dpl.checkout(mockingbird)).to eq(false)
      expect(dpl.checkout(jane_eyre)).to eq(false)

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee) 

      expect(dpl.checkout(jane_eyre)).to eq(true)
      expect(dpl.checked_out_books).to eq([jane_eyre])

      expect(dpl.checkout(jane_eyre)).to eq(false)

    end
  end

  describe '#return' do 
    it 'removes the checkout out book from the checked out list of books' do 
      dpl = Library.new("Denver Public Library")  

      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      professor = charlotte_bronte.write("The Professor", "1857")    
      villette = charlotte_bronte.write("Villette", "1853")    

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    

      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 

      expect(dpl.checkout(mockingbird)).to eq(false)
      expect(dpl.checkout(jane_eyre)).to eq(false)

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee) 

      expect(dpl.checkout(jane_eyre)).to eq(true)
      expect(dpl.checked_out_books).to eq([jane_eyre])

      expect(dpl.checkout(jane_eyre)).to eq(false)

      dpl.return(jane_eyre) 
      expect(dpl.checked_out_books).to eq([])
      expect(dpl.checkout(jane_eyre)).to eq(true)
      expect(dpl.checkout(villette)).to eq(true)
      expect(dpl.checked_out_books).to eq([jane_eyre, villette])
      expect(dpl.checkout(mockingbird)).to eq(true)

      dpl.return(mockingbird)

      expect(dpl.checkout(mockingbird)).to eq(true)

      dpl.return(mockingbird) 

      expect(dpl.checkout(mockingbird)).to eq(true)

      expect(dpl.most_popular_book).to eq(mockingbird)

    end
  end
end