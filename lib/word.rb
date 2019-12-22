class Word
  attr_reader :name, :id

  @@word_list = {}
  @@word_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@word_rows += 1
  end

  def self.all
    @@word_list.values
  end

  def save
    @@word_list[self.id] = Word.new(self.id, self.name)
  end

  def clear
    @@word_list = {}
  end

  def ==(word_to_compare)
    self.name.downcase.eql?(word_to_compare.name.downcase)
  end

end
