class Define
  attr_reader :name, :id, :length

  @@meaning_list = {}
  @@rows = 0

  def initialize(attributes)
    @type = attributes.fetch(:type)
    @name = attributes.fetch(:name).downcase.capitalize!
    @id = attributes.fetch(:id) || @@rows += 1
  end

  def self.all
    @@meaning_list.values
  end

  def save
    @@meaning_list[self.id] = Word.new({:type => self.type, :name => self.name, :id => self.id})
  end

  def self.clear
    @@meaning_list = {}
  end

  def ==(word_to_compare)
    self.name.downcase.eql?(word_to_compare.name.downcase)
  end

  def self.find(def_id)
    @@meaning_list[def_id]
  end

  def update(name)
    @name = name.downcase.capitalize!
    @type = type
    @@meaning_list[self.id] = Word.new({:type => @type, :name => @name, :id => self.id})
  end

  def delete
    @@meaning_list.delete(self.id)
  end

  def self.search(input_type)
    return_array = @@meaning_list.values.select { |definition| definition.type == input_type }
    if return_array == []
      return "No results found for your search"
    else
      return_array.sort_by { |definition| [definition.name] }
    end
  end
end
