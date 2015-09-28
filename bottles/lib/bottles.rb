class Bottles
  def verse(num)
    bottles = BottleNumber.new(num)
    bottles_next = BottleNumber.new(bottles.decrement)

    "#{bottles.no_more.capitalize} #{bottles.bottles_or_bottle} of beer on the wall, #{bottles.no_more} #{bottles.bottles_or_bottle} of beer.\n" +
    "#{bottles.action}, #{bottles_next.no_more} #{bottles_next.bottles_or_bottle} of beer on the wall.\n"
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

    def no_more
      @num == 0 ? "no more" : @num.to_s
    end

    def decrement
      return 99 if @num == 0
      @num - 1
    end

    def bottles_remaining
      "#{bottles_next.no_more} #{bottles_next.bottles_or_bottle}"
    end

    def action
      if @num == 0
        "Go to the store and buy some more"
      else
        "Take #{it_or_one} down and pass it around"
      end
    end

    def bottles_or_bottle_dec
      (@num-1) == 1 ? "bottle" : "bottles"
    end

    # NOTE: Depends on differing values so requires changes in state.
    def bottles_or_bottle
      @num == 1 ? "bottle" : "bottles"
    end

    def it_or_one
      @num == 1 ? "it" : "one"
    end
  end
end
