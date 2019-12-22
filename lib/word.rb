class Word
  attr_reader :name, :id

  @@word_list = {}
  @@word_rows = 0

  def initialize(name, id)
    @name = name.downcase.capitalize!
    @id = id || @@word_rows += 1
  end

  def self.all
    @@word_list.values
  end

  def save
    @@word_list[self.id] = Word.new(self.name, self.id)
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
    @@word_list[self.id] = Word.new(@name, self.id)
  end

end
