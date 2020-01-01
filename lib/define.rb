class Define
  attr_reader :type, :name, :id, :word_id

  @@meaning_list = {}
  @@rows = 0

  def initialize(attributes)
    @type = attributes.fetch(:type)
    @name = attributes.fetch(:name).downcase
    @id = attributes.fetch(:id) || @@rows += 1
    @word_id = attributes.fetch(:word_id)
  end

  def self.all
    @@meaning_list.values
  end

  def save
    @@meaning_list[self.id] = Define.new({:type => self.type, :name => self.name, :id => self.id, :word_id => self.word_id})
  end

  def self.clear
    @@meaning_list = {}
  end

  def ==(definition_to_compare)
    self.name.downcase.eql?(definition_to_compare.name.downcase)
  end

  def self.find(def_id)
    @@meaning_list[def_id]
  end

  def update(input)
    @type = input.fetch(:type)
    @name = input.fetch(:name)
    @@meaning_list[self.id] = Define.new({:type => @type, :name => @name, :id => self.id, :word_id => self.word_id})
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
