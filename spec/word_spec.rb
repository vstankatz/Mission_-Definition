require 'rspec'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear
  end

  describe('#save') do
    it('saves the word') do
      word1 = Word.new({:name => "heart", :id => nil})
      word1.save
      expect(word1.name).to(eq("Heart"))
      expect(Word.all).to(eq([word1]))
    end
  end

  describe('.all') do
    it('shows all the words') do
      word1 = Word.new({:name => "Courage", :id => nil})
      word1.save
      word2 = Word.new({:name => "Heart", :id => nil})
      word2.save
      word3 = Word.new({:name => "Brain", :id => nil})
      word3.save
      word4 = Word.new({:name => "Home", :id => nil})
      word4.save
      expect(Word.all).to(eq([word1, word2, word3, word4]))
    end
  end

  describe('.clear') do
    it('clears the word_list') do
      word1 = Word.new({:name => "Courage", :id => nil})
      word1.save
      word2 = Word.new({:name => "Heart", :id => nil})
      word2.save
      word3 = Word.new({:name => "Brain", :id => nil})
      word3.save
      word4 = Word.new({:name => "Home", :id => nil})
      word4.save
      Word.clear
      expect(Word.all). to(eq([]))
    end
  end

  describe('#==') do
    it('should be the same word if spelled the same') do
      word1 = Word.new({:name => "Brain", :id => nil})
      word1.save
      word2 = Word.new({:name => "Brain", :id => nil})
      word2.save
      expect(word1).to(eq(word2))
    end
  end

  describe('.find') do
    it('should find the word by the id') do
      word1 = Word.new({:name => "Courage", :id => nil})
      word1.save
      word2 = Word.new({:name => "Heart", :id => nil})
      word2.save
      word3 = Word.new({:name => "Brain", :id => nil})
      word3.save
      word4 = Word.new({:name => "Home", :id => nil})
      word4.save
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end

  describe('#update') do
    it('should update the word') do
      word = Word.new({:name => "Home", :id => nil})
      word.save
      word.update("kansas")
      expect(word.name).to(eq('Kansas'))
    end
  end

  describe('#delete') do
    it('should delete the chosen word') do
      word1 = Word.new({:name => "Heart", :id => nil})
      word1.save
      word2 = Word.new({:name => "Home", :id => nil})
      word2.save
      word1.delete
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('update') do
    it('should update the word') do
      word1 = Word.new({:name => "Heart", :id => nil})
      word1.save
      word1.update("Courage")
      expect(word1.name).to(eq("Courage"))
    end
  end

  describe('definitions') do
    it('should tie a definition to the word') do
      word1 = Word.new({:name => "Heart", :id => nil})
      word1.save
      def1 = Define.new({:type => "Noun", :name => "The human organ responsible for maintaining the cardiovascular system", :id => nil, :word_id => word1.id})
      def1.save
      expect(word1.definitions).to(eq([def1]))
    end
  end

  describe('search') do
    it('should search for words based on the name') do
    word1 = Word.new({:name => "Courage", :id => nil})
    word1.save
    word2 = Word.new({:name => "Heart", :id => nil})
    word2.save
    word3 = Word.new({:name => "Brain", :id => nil})
    word3.save
    word4 = Word.new({:name => "Home", :id => nil})
    word4.save
    expect(Word.search("home")).to(eq([word4]))
    expect(Word.search('a')).to(eq([word3, word2, word1]))
    end
  end


end
