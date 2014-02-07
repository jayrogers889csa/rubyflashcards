class Deck

  attr_accessor :cards, :new_card
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
    load_cards
  end

  def load_cards
   file =  File.open(filename)
   slices = []
   file.readlines.each_slice(3) { |slice| slices << slice }
   slices.each {|slice| self.cards << Card.new(slice[1].chomp, slice[0].chomp)}
  end

  def delete_card_from_deck(term)
    self.cards.delete_if { |card| card.term == term }
  end

  def shuffle_cards!
    self.cards.shuffle!
  end

  def pull_random_card
    random_card = self.cards.sample
    [random_card.term, random_card.definition]
  end

  def pull_next_card!
    self.cards.delete_at(0)
  end

end

class Card

  attr_reader :term, :definition

  def initialize(term, definition)
    @term = term
    @definition = definition
  end

end
