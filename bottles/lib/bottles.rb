class Bottles
  def verse(num)
      "#{no_more(num).capitalize} #{bottles_or_bottle(num)} of beer on the wall, #{no_more(num)} #{bottles_or_bottle(num)} of beer.\n" +
        "#{action(num)}, #{bottles_remaining(num)} of beer on the wall.\n"
  end

  def verses(num, num2)
    result = ""
    num.downto(num2).each do |v|
      result += verse(v) + "\n"
    end
    result
  end

  def sing
    verses(99,0)
  end

  private
  def action(num)
    if num == 0
      "Go to the store and buy some more"
    else
      "Take #{it_or_one(num)} down and pass it around"
    end
  end

  def bottles_or_bottle(num)
    num == 1 ? "bottle" : "bottles"
  end

  def it_or_one(num)
    num == 1 ? "it" : "one"
  end

  def bottles_remaining(num)
    if num == 1
      "no more bottles"
    else
      "#{decrement(num)} #{bottles_or_bottle(num - 1)}"
    end
  end

  def decrement(num)
    return 99 if num == 0
    num - 1
  end

  def no_more(num)
    num == 0 ? "no more" : "#{num}"
  end
end
