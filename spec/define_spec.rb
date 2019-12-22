require 'rspec'
require 'define'

describe('#Define') do
  before(:each) do
    Define.clear
    Word.clear
    @word = Word.new({:name => "Courage", :id => nil})
    @word.save
  end


    describe('#save') do
      it('saves the definition') do
        def1 = Define.new({:type => "Noun", :name => "the ability to do something that frightens one.", :id => nil, :word_id => @word.id})
        def1.save
        expect(Define.all).to(eq([def1]))
      end
    end

    describe('.all') do
      it('shows all the definition for that word') do
        def1 = Define.new({:type => "Noun", :name => "the ability to do something that frightens one.", :id => nil, :word_id => @word.id})
        def1.save
        def2 = Define.new({:type => "Noun", :name => "strength in the face of pain or grief.", :id => nil, :word_id => @word.id})
        def2.save
        expect(Define.all).to(eq([def1, def2]))
      end
    end

    describe('.clear') do
      it('clears the meaning_list') do
        def1 = Define.new({:type => "Noun", :name => "the ability to do something that frightens one.", :id => nil, :word_id => @word.id})
        def1.save
        def2 = Define.new({:type => "Noun", :name => "strength in the face of pain or grief.", :id => nil, :word_id => @word.id})
        def2.save
        Define.clear
        expect(Define.all). to(eq([]))
      end
    end

    describe('#==') do
      it('should be the same definition if typed the same') do
        def1 = Define.new({:type => "Noun", :name => "the ability to do something that frightens one.", :id => nil, :word_id => @word.id})
        def1.save
        def2 = Define.new({:type => "verb", :name => "the ability to do something that frightens one.", :id => nil, :word_id => @word.id})
        def2.save
        expect(def1).to(eq(def2))
      end
    end

    describe('.find') do
      it('should find the definition by the id') do
        def1 = Define.new({:type => "Noun", :name => "the ability to do something that frightens one.", :id => nil, :word_id => @word.id})
        def1.save
        def2 = Define.new({:type => "Noun", :name => "strength in the face of pain or grief.", :id => nil, :word_id => @word.id})
        def2.save
        def3 = Define.new({:type => "Noun", :name => "name of cartoon dog.", :id => nil, :word_id => @word.id})
        def3.save
        expect(Define.find(def3.id)).to(eq(def3))
      end
    end

    describe('#update') do
      it('should update the definition') do
        def1 = Define.new({:type => "Noun", :name => "the ability to do something that frightens one. strength in the face of pain or grief.", :id => nil, :word_id => @word.id})
        def1.save
        # puts def1.name
        def1.update({:type => "Verb", :name => def1.name})
        expect(def1.type).to(eq('Verb'))
      end
    end

    # describe('#delete') do
    #   it('should delete the chosen definition') do
    #
    #     word1.delete
    #     expect(Define.all).to(eq([word2]))
    #   end
    # end
    #
    # describe('search') do
    #   it('should search for definitions in a word based on the words attribute') do
    #
    #   expect(Define.search("home")).to(eq([word4]))
    #   end
    # end
    #

end
