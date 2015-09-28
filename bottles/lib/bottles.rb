class Bottles
  def verse(num)
    bottles = BottleNumber.for(num)
    bottles_next = BottleNumber.for(bottles.decrement)

    "#{bottles.bottles_remaining.capitalize} of beer on the wall, #{bottles.bottles_remaining} of beer.\n" +
    "#{bottles.action}, #{bottles_next.bottles_remaining} of beer on the wall.\n"
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

  class BottleNumber
    attr_reader :num

    def initialize(num = 99)
      @num = num
    end

    def self.for(num)
      if num == 0
        BottleNumberZero.new(num)
      elsif num == 1
        BottleNumberOne.new(num)
      elsif num == 6
        BottleNumberSix.new(num)
      elsif (num % 6) == 0 && num > 0
        BottleNumberMultiplesOfSix.new(num)
      else
        BottleNumber.new(num)
      end
    end

    def no_more
      @num.to_s
    end

    def decrement
      @num - 1
    end

    def bottles_remaining
      "#{no_more} #{bottles_or_bottle}"
    end

    def action
      "Take #{it_or_one} down and pass it around"
    end

    def bottles_or_bottle
      "bottles"
    end

    def it_or_one
      "one"
    end
  end

  #  ZERO
  class BottleNumberZero < BottleNumber
    def action
      "Go to the store and buy some more"
    end

    def no_more
      "no more"
    end

    def decrement
      99
    end
  end

  #  ONE
  class BottleNumberOne < BottleNumber
    def bottles_or_bottle
      "bottle"
    end

    def it_or_one
      "it"
    end
  end

  #  MULTIPLES OF SIX
  class BottleNumberSix < BottleNumber
    def bottles_remaining
      "1 six-pack"
    end
  end

  #  MULTIPLES OF SIX
  class BottleNumberMultiplesOfSix < BottleNumber
    def bottles_remaining
      "#{@num / 6} six-packs"
    end
  end
end
