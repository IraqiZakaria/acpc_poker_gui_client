
# Local classes
require File.expand_path('../pile_of_cards', __FILE__)

# A hand of cards.
class Hand < PileOfCards
   def to_s
      self.join
   end
end
