require_relative 'deck.rb'

class CardController
  attr_accessor :definition_store, :term_store
  attr_reader :deck

  def initialize
    @deck = Deck.new('flashcard_samples.txt')
  end

  def got_term_right(term)
    puts deck.cards.length
    deck.delete_card_from_deck(term)
    puts deck.cards.length
  end

  def display_definition
    self.pull_card
    self.definition_store
  end

  def check_guess(term)
    term.downcase == self.term_store.downcase
  end


  def pull_card
    a = deck.pull_random_card
    # p a
    self.definition_store = a[1]
    self.term_store = a[0]
    # puts term_store.downcase
  end
end

