class Word
  attr_reader :name, :id, :length

  @@word_list = {}
  @@word_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name).downcase.capitalize!
    @id = (attributes.fetch(:id)) || (@@word_rows += 1)
    @length = attributes.fetch(:name).split("").length
  end

  def self.all
    @@word_list.values
  end

  def save
    @@word_list[self.id] = Word.new({:name => self.name, :id => self.id})
  end

  def self.clear
    @@word_list = {}
  end

  def ==(word_to_compare)
    self.name.downcase.eql?(word_to_compare.name.downcase)
  end

  def self.find(word_id)
    @@word_list[word_id]
  end

  def update(name)
    @name = name.downcase.capitalize!
    @@word_list[self.id] = Word.new({:name => @name, :id => self.id})
  end

  def delete
    @@word_list.delete(self.id)
  end

  def self.search(name)
    return_array = @@word_list.values.select { |word| word.name.downcase.include? name.downcase }
    if return_array == []
      return "No results found for your search"
    else
      return_array.sort_by { |word| [word.length, word.name] }
    end
  end

end
