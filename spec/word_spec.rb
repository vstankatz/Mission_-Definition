require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear
  end

  describe('#save') do
    it('saves the word') do
      word1 = Word.new("heart", nil)
      word1.save
      expect(word1.name).to(eq("Heart"))
      expect(Word.all).to(eq([word1]))
    end
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

  describe('.clear') do
    it('clears the word_list') do
      word1 = Word.new("Courage", nil)
      word1.save
      word2 = Word.new("Heart", nil)
      word2.save
      word3 = Word.new("Brain", nil)
      word3.save
      word4 = Word.new("Home", nil)
      word4.save
      Word.clear
      expect(Word.all). to(eq([]))
    end
  end

  describe('#==') do
    it('should be the same word if spelled the same') do
      word1 = Word.new("Brain", nil)
      word1.save
      word2 = Word.new("Brain", nil)
      word2.save
      expect(word1).to(eq(word2))
    end
  end

  describe('.find') do
    it('should find the word by the id') do
      word1 = Word.new("Courage", nil)
      word1.save
      word2 = Word.new("Heart", nil)
      word2.save
      word3 = Word.new("Brain", nil)
      word3.save
      word4 = Word.new("Home", nil)
      word4.save
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end

  describe('#update') do
    it('should update the word') do
      word = Word.new("Home", nil)
      word.save
      word.update("kansas")
      expect(word.name).to(eq('Kansas'))
    end
  end


end
