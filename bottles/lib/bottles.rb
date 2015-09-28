class Bottles
  attr_accessor :verses

  def verses(*verse_indexes)
    @verses ||= []
    @verses[*verse_indexes]
  end

  def verse(bottle_count)
    last_phrase = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

    return last_phrase if (bottle_count <= 0)

    deducted = bottle_count - 1

    last = deducted == 0 ? "no more" : deducted;
    word = (bottle_count == 0 || bottle_count > 1) ? "bottles" : "bottle"
    last_word = (deducted == 0 || deducted > 1) ? "bottles" : "bottle"
    it_or_one = (bottle_count == 1) ? "it" : "one"

    "#{bottle_count} #{word} of beer on the wall, #{bottle_count} #{word} of beer.\nTake #{it_or_one} down and pass it around, #{last} #{last_word} of beer on the wall.\n"
  end
end
