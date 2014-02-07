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
    slices.each do |slice|
      hash = {:term => slice[1].chomp, :definition => slice[0].chomp}
      self.cards << new_object(Card, hash)
    end
  end

  def new_object(klass,options)
    klass.new(options)
  end

  def delete_card_from_deck(term_to_delete)
    self.cards.delete_if { |card| card.options[:term] == term_to_delete }
  end

  def pull_random_card
    random_card = self.cards.sample
    random_card.options
  end

end

class Card

  attr_reader :options

  def initialize(options)
    @options = options
  end

end

