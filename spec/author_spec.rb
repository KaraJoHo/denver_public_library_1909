require './lib/author'
require './lib/book'

RSpec.describe Author do 
  it 'exists and has attributes' do 
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})     

    expect(charlotte_bronte).to be_a(Author)
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end
end