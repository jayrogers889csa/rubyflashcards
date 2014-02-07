# Main file for

class Deck

  attr_accessor :cards, :new_card
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
    # @new_card = Card.new
    load_cards
  end

  def load_cards
   file =  File.open(filename)
   slices = []
   file.readlines.each_slice(3) { |slice| slices << slice }
   slices.each {|slice| self.cards << Card.new(slice[1], slice[0])}
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

deck = Deck.new('flashcard_samples.txt')
p deck.cards

puts "--------------------"
p deck.shuffle_cards!

puts "------------------"
# p deck.pull_random_card
p deck.pull_next_card!
puts "-----------------------"
p deck.cards

p deck.pull_random_card
