class Deck

  attr_accessor :cards, :new_card
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
    load_cards
  end

  def load_cards #eliminated creating the slices array and then having to iterate over that to create new Card objects. Just grabbed the slices from the text file and for each slice created a new Card object with a hash containing the term and defintion attributes.
    file =  File.open(filename)
    file.readlines.each_slice(3) do |slice|
      card_attributes = {:term => slice[1].chomp, :definition => slice[0].chomp}
      self.cards << new_object(Card, card_attributes)
    end
  end

  def new_object(klass,options)
    klass.new(options)
  end

  def delete_card_from_deck(term_to_delete)
    self.cards.delete_if { |card| card.attributes[:term] == term_to_delete }
  end

  def pull_random_card
    random_card = self.cards.sample
    random_card.attributes
  end

end

class Card

  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

end

#RENAMED OPTIONS AND HASH TO BE MORE DESCRIPTIVE VARIABLE AND HASH NAMES (card_attributes and attributes(hash))
