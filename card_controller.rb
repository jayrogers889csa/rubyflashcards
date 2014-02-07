require_relative 'deck.rb'

class CardController
  attr_accessor :definition_store, :term_store
  attr_reader :deck

  def initialize
    @deck = Deck.new('flashcard_samples.txt')
  end

  def got_term_right(term)
    deck.delete_card_from_deck(term)
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
    self.definition_store = a.fetch(:definition)
    self.term_store = a.fetch(:term)
  end
end
