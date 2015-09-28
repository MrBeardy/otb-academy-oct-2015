class Bottles
  def verse(num)
    "#{pluralize(num).capitalize} of beer on the wall, #{pluralize num} of beer.\n#{outcome num}, #{pluralize(next_num(num))} of beer on the wall.\n"
  end

  def sing
    verses(max_num, 0)
  end

  def max_num
    99
  end

  def verses(num, num2)
    result = ""
    num.downto(num2).each do |v|
      result += self.verse(v) + "\n"
    end
    result
  end

  private

  def outcome(num)
    if (num >= 1)
      "Take #{article num} down and pass it around"
    else
      "Go to the store and buy some more"
    end
  end

  def article(num)
    if (num > 1)
      "one"
    else
      "it"
    end
  end

  def noun(num)
    if (num == 1)
      "bottle"
    else
      "bottles"
    end
  end

  def next_num(num)
    if (num < 1)
      max_num
    else
      num - 1
    end
  end

  def pluralize(num)
    if (num == 0)
      "no more #{noun num}"
    else
      "#{num} #{noun num}"
    end
  end
end
