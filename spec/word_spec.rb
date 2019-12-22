require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear
  end

  describe('.all') do
    it('shows all the words') do
      word1 = Word.new("Courage", nil)
      word1.save
      word2 = Word.new("Heart", nil)
      word2.save
      word3 = Word.new("Brain", nil)
      word3.save
      word4 = Word.new("Home", nil)
      word4.save
      expect(Word.all).to(eq([word1, word2, word3, word4]))
    end
  end
end
