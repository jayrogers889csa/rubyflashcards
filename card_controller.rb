# require_relative

class CardController
  attr_accessor :definition_store, :term_store


  def display_definition
    self.pull_card
    self.definition_store
  end

  def check_guess(term)
    term.downcase == term_store.downcase
  end


  def pull_card
    a = ["BEGIN", "Designates code that must be run unconditionally at the beginning of the program before any other."]
    self.definition_store = a[1]
    self.term_store = a[0]
  end
end

