require './lib/author'
require './lib/book'
require './lib/library'

RSpec.require Library do 
  dpl = Library.new("Denver Public Library")  

  expect(dpl).to be_a(Library)
  expect(dpl.name).to eq("Denver Public Library")
  expect(dpl.books).to eq([])
  expect(dpl.authors).to eq([])
end