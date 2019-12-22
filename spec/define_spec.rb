require 'rspec'
require 'define'

describe('#Define') do
  before(:each) do
    Define.clear
    Word.clear
    @word = Word.new("Courage", nil)
    @word.save
  end


    describe('#save') do
      it('saves the definition') do

        expect(Define.all).to(eq())
      end
    end

    describe('.all') do
      it('shows all the definition for that word') do

        expect(Define.all).to(eq())
      end
    end

    describe('.clear') do
      it('clears the meaning_list') do

        Word.clear
        expect(Define.all). to(eq([]))
      end
    end

    describe('#==') do
      it('should be the same definition if typed the same') do

        expect(word1).to(eq(word2))
      end
    end

    describe('.find') do
      it('should find the definition by the id') do

        expect(Define.find(word2.id)).to(eq(word2))
      end
    end

    describe('#update') do
      it('should update the definition') do

        expect(word.name).to(eq('Kansas'))
      end
    end

    describe('#delete') do
      it('should delete the chosen definition') do

        word1.delete
        expect(Define.all).to(eq([word2]))
      end
    end

    describe('search') do
      it('should search for definitions in a word based on the words attribute') do

      expect(Define.search("home")).to(eq([word4]))
      end
    end


end
