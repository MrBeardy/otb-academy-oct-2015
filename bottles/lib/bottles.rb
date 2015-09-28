class Bottles
    def verse(num)
        if num > 2
            "#{num} bottles of beer on the wall, #{num} bottles of beer.\nTake one down and pass it around, #{num-1} bottles of beer on the wall.\n"
    elsif num == 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\nTake one down and pass it around, #{num-1} bottle of beer on the wall.\n"
    elsif num == 1
      "#{num} bottle of beer on the wall, #{num} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
    end

  def verses(num, num2)
    result = ""
    num.downto(num2).each do |v|
      result += self.verse(v) + "\n"
    end
    result
  end

  def sing
    verses(99,0)
  end
end
